//enfermera responsable
select nurse from obs_admision where SubcaseID='b5da....'

//matrona responsable
select midwife from obs_admision where SubcaseID='b5da......'

//Tipo de consistencia dilatacion >5
Select Value FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE103' And SubCode = 'NTE104-1' order by (ABS(datediff( TimeStamp ,  (SELECT TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And DescriptionSubCode = 'Dilation' And Value >'5'  order by TimeStamp asc LIMIT 1) ))) asc limit 1

//Tipo de posición dilatacion < 5
Select TimeStamp, Value FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE103' And SubCode = 'NTE107-3' order by (ABS(datediff( TimeStamp ,  (SELECT TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And DescriptionSubCode = 'Dilation' And Value <'5'  order by TimeStamp asc LIMIT 1) ))) asc limit 1

//Tipo de posición dilatacion > 5
Select TimeStamp, Value FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE103' And DescriptionSubCode = 'Position' order by (ABS(datediff( TimeStamp ,  (SELECT TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And DescriptionSubCode = 'Dilation' And Value >'5'  order by TimeStamp asc LIMIT 1) ))) asc limit 1

//Plano y posición al inicio (dilatación = 1)
SELECT CONCAT(  ('Plano: '), ((SELECT Value      FROM sysmed_bsc.datos_demograficos      WHERE PatientID = 'Replace_By_PatientID'      AND Code = 'NTE107'      AND SubCode = 'NTE107-2'      ORDER BY (ABS(      DATEDIFF(      datos_demograficos.TimeStamp      , (SELECT          datos_demograficos.TimeStamp        FROM sysmed_bsc.datos_demograficos        WHERE PatientID = 'Replace_By_PatientID'        AND Code = 'NTE104'        AND SubCode = 'NTE104-1'        AND Value = '1'        ORDER BY datos_demograficos.TimeStamp ASC LIMIT 1))      ))      Asc      LIMIT 1)),  (' Posicion: '), (((SELECT Value        FROM sysmed_bsc.datos_demograficos        WHERE PatientID = 'Replace_By_PatientID'        AND Code = 'NTE107'        AND SubCode = 'NTE107-3'        ORDER BY (ABS(        DATEDIFF(        datos_demograficos.TimeStamp        , (SELECT            datos_demograficos.TimeStamp          FROM sysmed_bsc.datos_demograficos          WHERE PatientID = 'Replace_By_PatientID'  AND Code = 'NTE104' AND SubCode = 'NTE104-1'  AND Value = '1' ORDER BY datos_demograficos.TimeStamp ASC LIMIT 1)))) Asc LIMIT 1)))) AS Plano_y_Posicion

//Plano y posicion a mitad parto (dilatación = 5)
SELECT CONCAT(  ('Plano: '), ((SELECT Value      FROM sysmed_bsc.datos_demograficos      WHERE PatientID='Replace_By_PatientID'      AND Code = 'NTE107'      AND SubCode = 'NTE107-2'      ORDER BY (ABS(      DATEDIFF(      datos_demograficos.TimeStamp      , (SELECT          datos_demograficos.TimeStamp        FROM sysmed_bsc.datos_demograficos        WHERE PatientID='Replace_By_PatientID'        AND Code = 'NTE104'        AND SubCode = 'NTE104-1'        AND Value = '5'        ORDER BY datos_demograficos.TimeStamp ASC LIMIT 1))      ))      Asc      LIMIT 1)),  (' Posicion: '), (((SELECT Value        FROM sysmed_bsc.datos_demograficos        WHERE PatientID='Replace_By_PatientID'        AND Code = 'NTE107'        AND SubCode = 'NTE107-3'        ORDER BY (ABS(        DATEDIFF(        datos_demograficos.TimeStamp        , (SELECT            datos_demograficos.TimeStamp          FROM sysmed_bsc.datos_demograficos          WHERE PatientID='Replace_By_PatientID'  AND Code = 'NTE104' AND SubCode = 'NTE104-1' AND Value = '5' ORDER BY datos_demograficos.TimeStamp ASC LIMIT 1)))) Asc LIMIT 1)))) AS Plano_y_Posicion

//Plano y posicion al fin (dilatación = 10)
SELECT CONCAT(  ('Plano: '), ((SELECT Value      FROM sysmed_bsc.datos_demograficos      WHERE PatientID='Replace_By_PatientID'      AND Code = 'NTE107'      AND SubCode = 'NTE107-2'      ORDER BY (ABS(      DATEDIFF(      datos_demograficos.TimeStamp      , (SELECT          datos_demograficos.TimeStamp        FROM sysmed_bsc.datos_demograficos        WHERE PatientID='Replace_By_PatientID'        AND Code = 'NTE104'        AND SubCode = 'NTE104-1'        AND Value = '1'        ORDER BY datos_demograficos.TimeStamp ASC LIMIT 1))      ))      Asc      LIMIT 1)),  (' Posicion: '), (((SELECT Value        FROM sysmed_bsc.datos_demograficos        WHERE PatientID='Replace_By_PatientID'        AND Code = 'NTE107'        AND SubCode = 'NTE107-3'        ORDER BY (ABS(        DATEDIFF(        datos_demograficos.TimeStamp        , (SELECT            datos_demograficos.TimeStamp          FROM sysmed_bsc.datos_demograficos          WHERE PatientID='Replace_By_PatientID'  AND Code = 'NTE104' AND SubCode = 'NTE104-1' AND Value = '10' ORDER BY datos_demograficos.TimeStamp ASC LIMIT 1)))) Asc LIMIT 1)))) AS Plano_y_Posicion

//Bishop dilatacion = 1
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND Code='P3_EXPL004' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value ='1'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//Bishop dilatacion = 5
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND Code='P3_EXPL004' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value ='5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//Bishop dilatacion = 10
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND Code='P3_EXPL004' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value ='10'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//liquido amniotico inicio
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-3' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value <'5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//cantidad liquido amniotico al inicio
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-4' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value <'5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//olor liquido amniotico inicio
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-5' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value <'5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//liquido amniotico a mitad (dila = 5)
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-3' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value ='5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//cantidad liquido amniotico a mitad
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-4' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value ='5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//olor liquido a mitad
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-5' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value ='5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//liquido amniotico al final
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-3' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value >'5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//cantidad liquido amniótico al final
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-4' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value >'8'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//olor liquido al final
Select value from sysmed_bsc.datos_demograficos dd where PatientID='Replace_By_PatientID' AND SubCode='NTE106-5' order by (ABS(datediff( dd.TimeStamp ,  (SELECT      TimeStamp  FROM sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND Code='NTE104' And SubCode = 'NTE104-1' And Value >'5'  order by TimeStamp asc LIMIT 1) )))asc limit 1

//tipo de parto vaginal/cesarea/aborto inicio
select value from sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode='P6_PART002'


//metodo de inducción
select value from sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode='P6_PART001'


//cesarea (S/N)
select value from sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode='P6_PART022'

//ph
Select value from sysmed_bsc.datos_demograficos dd where dd.PatientID='Replace_By_PatientID' and dd.SubCode='NTE053-2'

//posicion placenta
Select value from sysmed_bsc.datos_demograficos dd where dd.PatientID='Replace_By_PatientID' and dd.SubCode='P3_EXPL008'

//Episiotomia (S/N)
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P6_PART008' AND dd.PatientID='Replace_By_PatientID';

//Desgarro (S/N)
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P6_PART009' AND dd.PatientID='Replace_By_PatientID';

//tipo de parto fin
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P6_PART003' AND dd.PatientID='Replace_By_PatientID';

//tipo de alumbramiento
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P6_PART011' AND dd.PatientID='Replace_By_PatientID';

//donacion de cordon (S/N)
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P6_PART014' AND dd.PatientID='Replace_By_PatientID';

//Medicacion
select value from datos_demograficos dd where SubCode = 'NTE289-1' AND dd.PatientID='Replace_By_PatientID';

//Peso del recien nacido
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P7_FET002'

//Peso placenta
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P6_PART016';

//Sexo del recien nacido
Select Value FROM datos_demograficos dd  WHERE dd.SubCode = 'P7_FET003' AND dd.PatientID='Replace_By_PatientID';

//Talla del recien nacido
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P7_FET004' AND dd.PatientID='Replace_By_PatientID';

//Perímetro craneoencefalico
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P7_FET025' AND dd.PatientID='Replace_By_PatientID';

//Arteria PH
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET016'

//Arteria PCO2
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET017'

//Arteria PO2
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET018'

//Arteria EB
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET019'

//Vena PH
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET020'

//Vena PCO2
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET021'

//Vena PO2
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET022'

//Vena EB
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET023'

//Vitamina K (S/N)
Select Value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID'and SubCode='P7_FET013'

//Reanimación (s/n)
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P7_FET012'

//Apgar 1
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P7_FET005'

//Apgar 5
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P7_FET006'

//Apgar 10
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P7_FET007'

//tipo de lactancia
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P2_VALPP03'

//Destino neonato
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P7_FET024D' AND dd.PatientID='Replace_By_PatientID';

//Altura uterina
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P2_VALPP002'

//Retirada de cateter(S/N)
Select Value FROM datos_demograficos dd  WHERE SubCode = 'P7_FET026' AND dd.PatientID='Replace_By_PatientID';

//Anatomia patológica (S/N)
Select value From sysmed_bsc.datos_demograficos where PatientID='Replace_By_PatientID' AND SubCode = 'P2_VALPP04'




















