// 13. Сотрудники, выполненные проекты, участие в проектах.

use companydb

db.dropDatabase();

// 3.1 Отобразить коллекции базы данных
db.createCollection('employee');

show collections;

// 3.2 
//    1. Вставка одной записи insertOne
first_employee = db.getCollection('employee').insertOne({
    first_name: "Brandon",
    middle_name: "Shaun",
    last_name: "Walker",
    birth_date: "1976-04-10",
    salary: 3000,
    team:
    {
        name: "Team A",
        date_of_foundation: "2000-10-10"
    },
    course:
    [
        {
            name: "JS",
            is_passed: true
        },
        {
            name: "TypeScript",
            is_passed: true
        },
        {
            name: "React",
            is_passed: true
        },
        {
            name: "ReactTS",
            is_passed: true
        }
    ]
}
);

//    2. Вставка нескольких записей insertMany
db.getCollection('employee').insertMany([{
    first_name: "Garven",
    middle_name: "Shaun",
    last_name: "Dreis",
    birth_date: "1994-10-02",
    salary: 2500,
    team:
    {
        name: "Team A",
        date_of_foundation: "2000-10-10"
    },
    course:
    [
        {
            name: "Roga i kopita",
            is_passed: true
        },
        {
            name: "Roga i kopita ver.2",
            is_passed: true
        }
    ]
},
{
    first_name: "Anakin",
    middle_name: "",
    last_name: "Skywalker",
    birth_date: "1994-01-27",
    salary: 2000,
    team:
    {
        name: "Team B",
        date_of_foundation: "2000-10-12"
    },
    course:
    [
        {
            name: "ABC",
            is_passed: true
        },
        {
            name: "DE",
            is_passed: true
        },
        {
            name: "Roga",
            is_passed: false
        }
    ]
},
{
    first_name: "Vober",
    middle_name: "Shaylon",
    last_name: "Dand",
    birth_date: "1995-06-20",
    salary: 2700,
    team:
    {
        name: "Team C",
        date_of_foundation: "2000-10-13"
    },
    course:
    [
        {
            name: "Roga i kopita",
            is_passed: true
        },
        {
            name: "Roga i kopita ver.2",
            is_passed: true
        }
    ]
},
{
    first_name: "Willard",
    middle_name: "Shaylon",
    last_name: "Johns",
    birth_date: "1984-11",
    salary: 2700,
    team:
    {
        name: "Team D",
        date_of_foundation: "2000-10-14"
    },
    course:
    [
        {
            name: "Angular",
            is_passed: true
        },
        {
            name: "NodeJS",
            is_passed: true
        }
    ]
}
]);

// 3.3.1 Удаление одной записи по условию
db.getCollection('employee').deleteOne({ first_name: "Anakin" });

// 3.3.2 Удаление нескольких записей по условию
db.getCollection('employee').deleteMany({ salary: { $lt: 3000 } });

// 3.4 Поиск записей
// 1. Поиск записи по ID
db.getCollection('employee').findOne({ _id: first_employee.insertedId});

// 2. Поиск записи по атрибуту первого уровня
db.getCollection('employee').findOne({ first_name: "Willard" });

// 3. Поиск записи по вложенному атрибуту
db.getCollection('employee').findOne({ "team.name": "Team A" });

// 4. Поиск записи по нескольким атрибутам
db.getCollection('employee').findOne({
    "$and": [
        { salary: { $lt: 3000 } },
        { "team.name": "Team A" }
    ]
});

// 5. Поиск записи по одному из условий
db.getCollection('employee').findOne({
    "$or": [
        { salary: { $lt: 3000 } },
        { first_name: "Brandon" }
    ]
});

// 6. Поиск с использованием оператора сравнения
db.getCollection('employee').find({ salary: { $gt: 100 } });

// 7. Поиск с использованием двух операторов сравнения
db.getCollection('employee').find({ salary: { $gt: 100, $lt: 3000 } });

// 8. Поиск по значению в массиве
db.getCollection('employee').find({
    "course": {
        $elemMatch: {
            name: "Angular"
        }
    }
});

// 9. Поиск по кол-ву элементов в массиве
db.getCollection('employee').find({
    "course": {
        $size: 2
    }
});

// 10. Поиск записи без атрибута
db.getCollection('employee').find(
    { is_passed: { $exists: false } }
);

// 3.5 Обновление записей
// 1. Изменить значение атрибута у записи
db.getCollection('employee').updateOne(
    { first_name: "Willard" },
    { $set: { salary: 500000 } }
);

// 2. Удалить атрибут у записи
db.getCollection('employee').updateOne(
    { first_name: "Vober" },
    { $unset: { salary: 0 } }
);

// 3. Добавить атрибут у записи
db.getCollection('employee').updateOne(
    { first_name: "Garven" },
    { $set: { country: "Netherlands" } }
);