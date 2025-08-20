CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_55d3874212100e15`(
    `longitude` FLOAT64,
    `latitude` FLOAT64
)
BEGIN
  /*
   {"versionId":"5de53e15381b84f1","paramsId":"8ba41c2e333c9607","isImmutable":false,"diagramJson":"{\"title\":\"API - risk checking input long lat\",\"description\":\"\",\"nodes\":[{\"id\":\"77899989-c2ae-4179-a310-23c47e195ee9\",\"data\":{\"name\":\"native.pointfromstaticlatlon\",\"type\":\"generic\",\"label\":\"Point from Static LatLon\",\"inputs\":[{\"name\":\"lon\",\"type\":\"Number\",\"title\":\"Longitude\",\"min\":-180,\"max\":180,\"description\":\"Longitude\",\"value\":\"{{@longitude}}\"},{\"name\":\"lat\",\"type\":\"Number\",\"title\":\"Latitude\",\"min\":-90,\"max\":90,\"description\":\"Latitude\",\"value\":\"{{@latitude}}\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":208,\"y\":208},\"selected\":false},{\"id\":\"da6a53bb-c43d-437f-bc2c-c138bc741bf8\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"with get_h3 as (\\n  select `carto-un`.carto.H3_FROMGEOGPOINT(geo, 11) as h3 from `$b` \\n)\\n\\nselect a.* from `carto-dw-ac-ki5mm8fr.shared.output_risk_h3_format` a, get_h3 b where a.h3 = b.h3\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":432,\"y\":208},\"selected\":false},{\"id\":\"4b91e585-20a2-4424-87b4-c1c0623f0f6d\",\"data\":{\"name\":\"native.output\",\"type\":\"generic\",\"label\":\"API Output\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"mode\",\"type\":\"Selection\",\"mode\":\"radio\",\"title\":\"Execution method\",\"helper\":\"This setting controls the type of return value of the API call. Sync returns the result immediately, while Async returns a job ID.\",\"options\":[{\"icon\":\"sync\",\"name\":\"Sync\",\"value\":\"sync\",\"description\":\"Returns the result data directly in the API response.\"},{\"icon\":\"async\",\"name\":\"Async\",\"value\":\"async\",\"description\":\"Returns a job ID and table reference where the result will be available once completed.\"}],\"value\":\"sync\",\"default\":\"async\",\"allowExpressions\":false,\"providers\":[\"snowflake\",\"bigquery\"],\"description\":\"Execution method\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":624,\"y\":208},\"selected\":false}],\"edges\":[{\"id\":\"77899989-c2ae-4179-a310-23c47e195ee9result-da6a53bb-c43d-437f-bc2c-c138bc741bf8sourceb\",\"source\":\"77899989-c2ae-4179-a310-23c47e195ee9\",\"target\":\"da6a53bb-c43d-437f-bc2c-c138bc741bf8\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"da6a53bb-c43d-437f-bc2c-c138bc741bf8result-4b91e585-20a2-4424-87b4-c1c0623f0f6dsource\",\"source\":\"da6a53bb-c43d-437f-bc2c-c138bc741bf8\",\"target\":\"4b91e585-20a2-4424-87b4-c1c0623f0f6d\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"}],\"variables\":[{\"name\":\"longitude\",\"type\":\"Number\",\"order\":1,\"value\":\"106.82637474311103\",\"scopes\":[\"api\"]},{\"name\":\"latitude\",\"type\":\"Number\",\"order\":2,\"value\":\"-6.223410024034504\",\"scopes\":[\"api\"]}],\"procedure\":{\"call\":\"CALL `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_55d3874212100e15`(@longitude,@latitude)\",\"params\":\"{\\\"longitude\\\":106.82637474311103,\\\"latitude\\\":-6.223410024034504}\",\"status\":\"exists\",\"updatedAt\":1755664224944},\"schedule\":{},\"viewport\":{\"x\":-22.842689713748996,\"y\":-142.02352034850765,\"zoom\":2},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":false}"}
  */
  DECLARE __outputtable STRING;
  DECLARE __outputtablefqn STRING;
  SET `longitude` = COALESCE(`longitude`, 106.82637474311103);
  SET `latitude` = COALESCE(`latitude`, -6.223410024034504);
  SET __outputtable = 'wfproc_api_55d3874212100e15_out_' || SUBSTRING(TO_HEX(MD5(ARRAY_TO_STRING([CAST(`latitude` AS STRING),CAST(`longitude` AS STRING)], ','))), 1, 16);
  SET __outputtablefqn = 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_55d3874212100e15_out_' || SUBSTRING(TO_HEX(MD5(ARRAY_TO_STRING([CAST(`latitude` AS STRING),CAST(`longitude` AS STRING)], ','))), 1, 16);
  EXECUTE IMMEDIATE
  REPLACE(
    '''DROP TABLE IF EXISTS `##TABLENAME##`''',
    '##TABLENAME##',
    __outputtablefqn
  );
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_55d3874212100e15_eb5d11237a1279d3_result`
  AS
    SELECT ST_GEOGPOINT((`longitude`), (`latitude`)) geo;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_55d3874212100e15_ab579548894209ec_result`
  AS
    with get_h3 as (
      select `carto-un`.carto.H3_FROMGEOGPOINT(geo, 11) as h3 from `WORKFLOW_55d3874212100e15_eb5d11237a1279d3_result` 
    )
    select a.* from `carto-dw-ac-ki5mm8fr.shared.output_risk_h3_format` a, get_h3 b where a.h3 = b.h3;
  END;
  EXECUTE IMMEDIATE
  REPLACE(
    '''DROP TABLE IF EXISTS `##TABLENAME##`''',
    '##TABLENAME##',
    __outputtablefqn
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE OR REPLACE TABLE `##TABLENAME##`
    OPTIONS (
      expiration_timestamp = TIMESTAMP_ADD(
        CURRENT_TIMESTAMP(), INTERVAL 30 DAY
      )
    )
    AS
      SELECT * FROM WORKFLOW_55d3874212100e15_ab579548894209ec_result''',
    '##TABLENAME##',
    __outputtablefqn
  );
  EXECUTE IMMEDIATE
  REPLACE (
  '''SELECT * FROM `##TABLENAME##`''',
  '##TABLENAME##',
  __outputtablefqn
  );
END;