USE lw5;

SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- 1. Добавить внешние ключи.
ALTER TABLE room
    ADD CONSTRAINT `room_hotel_id_hotel_fk` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `room_room_category_id_room_category_fk` FOREIGN KEY (`id_room_category`) REFERENCES `room_category` (`id_room_category`)
        ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE booking
    ADD CONSTRAINT `booking_client_id_client_fk` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`)
        ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE room_in_booking
    ADD CONSTRAINT `room_in_booking_booking_id_booking_fk` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `room_in_booking_room_id_room_fk` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`)
        ON DELETE CASCADE ON UPDATE CASCADE;

-- 2. Выдать информацию о клиентах гостиницы “Космос”, проживающих в номерах категории “Люкс” на 1 апреля 2019
SELECT c.name, c.phone, rib.checkin_date AS checkin_date, rib.checkout_date AS checkout_date
FROM client c
    JOIN booking b ON c.id_client = b.id_client
    JOIN room_in_booking rib ON b.id_booking = rib.id_booking
    JOIN room r ON rib.id_room = r.id_room
    JOIN hotel h on r.id_hotel = h.id_hotel
    JOIN room_category rc on r.id_room_category = rc.id_room_category
WHERE h.name = 'Космос' AND rc.name = 'Люкс' AND '2019-04-01' BETWEEN rib.checkin_date AND rib.checkout_date - INTERVAL 1 DAY;

-- 3. Дать список свободных номеров всех гостиниц на 22 апреля
SELECT DISTINCT r.number AS room_number, h.name AS hotel_name, rc.name AS room_category, r.price AS price FROM room r
    JOIN room_in_booking rib on r.id_room = rib.id_room
    JOIN hotel h on r.id_hotel = h.id_hotel
    JOIN room_category rc on r.id_room_category = rc.id_room_category
WHERE '2019-04-22' NOT BETWEEN rib.checkin_date AND rib.checkout_date - INTERVAL 1 DAY
ORDER BY hotel_name;

-- 4. Дать количество проживающих в гостинице “Космос” на 23 марта по каждой категории номеров
SELECT rc.name AS category, COUNT(rib.id_room_in_booking) AS amount FROM room r
    JOIN room_in_booking rib ON r.id_room = rib.id_room
    JOIN room_category rc on r.id_room_category = rc.id_room_category
    JOIN hotel h on r.id_hotel = h.id_hotel
WHERE h.name = 'Космос' AND '2019-03-23' BETWEEN rib.checkin_date AND rib.checkout_date - INTERVAL 1 DAY
GROUP BY rc.id_room_category;

-- 5. Дать список последних проживавших клиентов по всем комнатам гостиницы 'Космос', выехавшим в апреле с указанием даты выезда
SELECT @@sql_mode;

# SELECT r.number, c.name, MAX(rib.checkout_date) AS checkout_date FROM client c
#     JOIN booking b on c.id_client = b.id_client
#     JOIN room_in_booking rib on b.id_booking = rib.id_booking AND month(rib.checkout_date) = 4
#     JOIN room r on r.id_room = rib.id_room
#     JOIN hotel h on h.id_hotel = r.id_hotel
# WHERE h.name = 'Космос'
# GROUP BY r.number, c.name;

# SELECT r.id_room,
#              MAX(rib.checkout_date) last_checkout_date
#       FROM room_in_booking rib
#                LEFT JOIN room r ON r.id_room = rib.id_room
#                LEFT JOIN booking b ON rib.id_booking = b.id_booking
#                LEFT JOIN hotel h ON r.id_hotel = h.id_hotel
#       WHERE MONTH(rib.checkout_date) = 4
#         AND h.name = 'Космос'
#       GROUP BY r.id_room;

SELECT room_last_checkout_date.id_room,
       room_last_checkout_date.last_checkout_date,
       c.*
FROM (SELECT r.id_room,
             MAX(rib.checkout_date) last_checkout_date
      FROM room_in_booking rib
               LEFT JOIN room r ON r.id_room = rib.id_room
               LEFT JOIN booking b ON rib.id_booking = b.id_booking
               LEFT JOIN hotel h ON r.id_hotel = h.id_hotel
      WHERE MONTH(rib.checkout_date) = 4
        AND h.name = 'Космос'
      GROUP BY r.id_room) room_last_checkout_date
         LEFT JOIN room_in_booking rib
                   ON room_last_checkout_date.id_room = rib.id_room AND
                      room_last_checkout_date.last_checkout_date = rib.checkout_date
         LEFT OUTER JOIN booking b2 ON b2.id_booking = rib.id_booking
         LEFT JOIN client c ON c.id_client = b2.id_client;

# select a,b from table where e = 5

-- 6. Продлить на 2 дня дату проживания в гостинице “Космос” всем клиентам комнат категории “Бизнес”, которые заселились 10 мая
UPDATE room_in_booking rib
    JOIN room r ON rib.id_room = r.id_room
    JOIN room_category rc on rc.id_room_category = r.id_room_category
    JOIN hotel h on r.id_hotel = h.id_hotel
SET rib.checkout_date = DATE_ADD(rib.checkout_date, INTERVAL 2 DAY)
WHERE h.name = 'Космос' AND rc.name = 'Бизнес' AND rib.checkin_date = '2019-05-10';

-- 7. Найти все "пересекающиеся" варианты проживания. Правильное состояние: не может быть забронирован один номер на одну дату несколько раз, т.к. нельзя заселиться нескольким клиентам в один номер
SELECT * FROM room_in_booking rib1
    JOIN room_in_booking rib2 ON rib1.id_room = rib2.id_room
WHERE rib1.id_room_in_booking <= rib2.id_room_in_booking
  AND rib1.checkin_date >= rib2.checkin_date
  AND rib1.checkout_date != rib2.checkout_date;

-- 8. Создать бронирование в транзакции
START TRANSACTION;
    INSERT booking (id_client, booking_date) VALUES (50, CURDATE());
    INSERT room_in_booking (id_booking, id_room, checkin_date, checkout_date) VALUES ((SELECT MAX(booking.id_booking) FROM booking), 154, '2022-05-09', '2022-05-30');
COMMIT;

-- 9. Добавить необходимые индексы для всех таблиц
ALTER TABLE room
    ADD INDEX room_id_hotel_idx (id_hotel),
    ADD INDEX room_id_room_category_idx (id_room_category);

ALTER TABLE booking
    ADD INDEX booking_id_client_idx (id_client);

ALTER TABLE room_in_booking
    ADD INDEX room_in_booking_id_booking_idx (id_booking),
    ADD INDEX room_in_booking_id_room_idx (id_room);

