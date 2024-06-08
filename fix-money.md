Для исправления ошибки в датасете нужно просто сделать в `source` аналогичную запись `payment` с `id`=`recipe1` в категории `education` от 1-го числа, но с исправленным значением `money`.

```sql
INSERT INTO source (value) VALUES ('{"category":"education","type":"payment","index":3,"id":"recipe1","money":50000,"date":"2021-01-01","purpose":"подкуп преподавателя"}');
````

