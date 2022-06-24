USE lw6;

-- 1. Добавить внешние ключи (в create_database.sql)
# ALTER TABLE `dealer`
#     ADD CONSTRAINT `fk_dealer_company`
#         FOREIGN KEY (`id_company`)
#         REFERENCES `lw6`.`company` (`id_company`);
#
# ALTER TABLE `production`
#     ADD CONSTRAINT `fk_production_medicine1`
#         FOREIGN KEY (`id_medicine`)
#         REFERENCES `lw6`.`medicine` (`id_medicine`)
#         ON DELETE CASCADE
#         ON UPDATE CASCADE,
#     ADD CONSTRAINT `fk_production_company1`
#         FOREIGN KEY (`id_company`)
#         REFERENCES `lw6`.`company` (`id_company`);
#
# ALTER TABLE `order`
#     ADD CONSTRAINT `fk_order_dealer1`
#         FOREIGN KEY (`id_dealer`)
#         REFERENCES `lw6`.`dealer` (`id_dealer`)
#         ON DELETE CASCADE
#         ON UPDATE CASCADE,
#     ADD CONSTRAINT `fk_order_pharmacy1`
#         FOREIGN KEY (`id_pharmacy`)
#         REFERENCES `lw6`.`pharmacy` (`id_pharmacy`)
#     ADD CONSTRAINT `fk_order_production1`
#         FOREIGN KEY (`id_production`)
#         REFERENCES `lw6`.`production` (`id_production`);

-- 2. Выдать информацию по всем заказам лекарства “Кордерон” компании “Аргус” с указанием названий аптек, дат, объема заказов.
SELECT p.name, o.date, o.quantity FROM `order` o
    JOIN pharmacy p ON o.id_pharmacy = p.id_pharmacy
    JOIN production p2 ON o.id_production = p2.id_production
    JOIN medicine m ON p2.id_medicine = m.id_medicine
    JOIN company c ON p2.id_company = c.id_company
WHERE m.name = 'Кордеон' AND c.name = 'Аргус';

-- 3. Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 25 января.
SELECT m.name FROM medicine m
    JOIN production p ON m.id_medicine = p.id_medicine
    JOIN company c ON c.id_company = p.id_company
WHERE c.name = 'Фарма' AND p.id_production NOT IN (
    SELECT o.id_production FROM `order` o
    WHERE o.date < '2019-01-25');

-- 4. Дать минимальный и максимальный баллы лекарств каждой фирмы, которая оформила не менее 120 заказов.
SELECT c.name AS company_name, MIN(p.rating) AS min_rating, MAX(p.rating) AS max_rating FROM production p
    JOIN company c on c.id_company = p.id_company
    JOIN `order` o on p.id_production = o.id_production
GROUP BY c.name HAVING COUNT(o.id_order) >= 120;

-- 5. Дать списки сделавших заказы аптек по всем дилерам компании “AstraZeneca”. Если у дилера нет заказов, в названии аптеки проставить NULL.
SELECT ph.name, d.name FROM dealer d
    LEFT JOIN company c on c.id_company = d.id_company
    LEFT JOIN `order` o on d.id_dealer = o.id_dealer
    LEFT JOIN pharmacy ph on o.id_pharmacy = ph.id_pharmacy
WHERE c.name = 'AstraZeneca';

-- 6. Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней.
UPDATE production p
    LEFT JOIN medicine m on m.id_medicine = p.id_medicine
SET p.price = p.price * 0.8
WHERE p.price > 3000 AND m.cure_duration <= 7;

-- 7. Добавить необходимые индексы.
CREATE INDEX `IX_dealer_id_company`
    ON dealer (`id_company`);

CREATE INDEX `IX_production_id_company-id_medicine`
    ON production (id_company, id_medicine);

CREATE INDEX `IX_order_id_production-id_pharmacy-id_dealer`
    ON `order` (id_production, id_pharmacy, id_dealer);

CREATE INDEX IX_production_price
    ON production (price);

CREATE INDEX IX_medicine_cure_duration
    ON medicine (cure_duration);

CREATE INDEX IX_order_date
    ON `order` (date);

SELECT o.id_order FROM `order` o
WHERE o.date > '2019-09-16';

# 296ms без индекса
# 152ms c индексом