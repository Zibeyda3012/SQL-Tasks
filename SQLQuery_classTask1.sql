
/*
1. Peter nəşriyyatı istisna olmaqla, hər hansı bir nəşriyyat tərəfindən nəşr olunan və eyni zamanda 20 rubldan ucuz olan bütün kitabları göstərin.
2. Peter nəşriyyatı istisna olmaqla, hər hansı bir nəşriyyat tərəfindən nəşr olunan və qiyməti 20 ilə 40 rubl arasında dəyişən bütün kitabları göstərin.
3. Peter Nəşriyyatı istisna olmaqla, hər hansı bir nəşriyyat tərəfindən çap edilmiş və ya 20-40 rubl, ya da 10 rubldan az qiymətə olan bütün kitabları göstərin.
4. Səhifəsinin qiyməti 10 qəpikdən aşağı olan bütün kitabları göstərin.
5. Ya dərslik (Tutorial) və ya “C&C++” mövzusunda olan və eyni zamanda ya “Peter” nəşriyyatı, ya da “DiaSoft” nəşriyyatı tərəfindən çap edilmiş bütün kitabları göstərin.

*/


/*
6. Adlarında “Windows” sözü olan bütün kitabları göstərin.
7. Adlarında “Windows” sözü olan, lakin “Microsoft” sözü olmayan bütün kitabları göstərin.
8. Adlarında ən azı bir rəqəm olan bütün kitabları göstərin.
9. Adlarında ən azı üç rəqəm olan bütün kitabları göstərin.
*/


--Task 1
SELECT *
FROM Books_En
WHERE [Publisher] != 'Peter' AND [Price] < 20


--Task 2
SELECT *
FROM Books_En
WHERE [Publisher] != 'Peter' AND [Price] BETWEEN 20 AND 40


--Task 3
SELECT *
FROM Books_En
WHERE [Publisher] != 'Peter' OR [Price] BETWEEN 20 AND 40 OR [Price] < 10



--Task 4 (bezi kitablarin deyerleri null ve 0 idi,ona gore bele Pages > 0 yoxlanisini vermisem)
SELECT *
FROM Books_En
WHERE Pages > 0 AND (Price/Pages) < 0.10


--Task 5
SELECT *
FROM Books_En
WHERE ([Publisher] IN ('Peter','DiaSoft')) AND ([Category] IN ('Tutorials', 'C & C ++'))



--Task 6
SELECT *
FROM Books_En
WHERE [Name] LIKE '%Windows%'


--Task 7
SELECT *
FROM Books_En
WHERE [Name] NOT LIKE '%Microsoft%' AND [Name] LIKE '%Windows%'


--Task 8
SELECT *
FROM Books_En
WHERE [Name] LIKE '%[0-9]%'


--Task 9
SELECT *
FROM Books_En
WHERE [Name] LIKE '%[0-9]%[0-9]%[0-9]%'








