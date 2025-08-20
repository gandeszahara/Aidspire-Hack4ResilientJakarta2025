-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: carto-un.carto. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_10b9150b2428644b`(
)
BEGIN
  /*
   {"versionId":"0e7a3ca820b09565","paramsId":"97d170e1550eee4a","isImmutable":false,"diagramJson":"{\"title\":\"analisis kelurahan level\",\"description\":\"\",\"nodes\":[{\"id\":\"1021df61-f8a8-4193-be5d-5abbacc15c9d\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"with floodrisk as (select a.geom, a.wadmkd, a.wadmkc, a.wadmkk, b.fri25 from `carto-dw-ac-ki5mm8fr.shared.data_kelurahan_neighborhood` a\\ninner join `carto-dw-ac-ki5mm8fr.shared.data_kelurahan_floodpredictions_2025_2045` b on a.wadmkd = b.wadmkd),\\ninformal as (\\n  select a.*, c.total as total_informal_settlements,\\n    case \\n      when fri25 >0 and fri25 <= 0.01 then \\\"Risiko Sangat Rendah\\\"\\n      when fri25 >0.01 and fri25 <= 4.05 then \\\"Risiko Rendah\\\"\\n      when fri25 >4.05 and fri25 <= 12.31 then \\\"Risiko Medium\\\" \\n      when fri25 >12.31 and fri25 <= 32.06 then \\\"Risiko Tinggi\\\" \\n      when fri25 >32.06 then \\\"Sangat Tinggi\\\" \\n    end as flood_class\\n  from floodrisk a\\n  inner join \\n  carto-dw-ac-ki5mm8fr.shared.data_kelurahan_residencelivingininformalsettlements c\\n  on a.wadmkd = c.wadmkd),\\nnorm as (\\n  select *,\\n    ML.MIN_MAX_SCALER(fri25) OVER() as fri25_norm,\\n    ML.MIN_MAX_SCALER(total_informal_settlements) OVER() as total_informal_settlements_norm,\\n  from informal),\\ncalculate_score as ( \\n  select *,\\n    (fri25_norm * 0.5) + (total_informal_settlements_norm * 0.5) as aid_score\\n  from norm)\\nselect *, \\n  case \\n    when  aid_score > 0 and aid_score <= 0.03 then \\\"Very Low Priority\\\"\\n    when  aid_score > 0.03 and aid_score <= 0.09 then \\\"Low Priority\\\"\\n    when  aid_score > 0.09 and aid_score <= 0.15 then \\\"Medium Priority\\\"\\n    when  aid_score > 0.15 and aid_score <= 0.25 then \\\"High Priority\\\"\\n    when  aid_score > 0.25 and aid_score <= 0.75 then \\\"Very High Priority\\\"\\n  end as aid_priority\\nfrom calculate_score\\n\\n\\n\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":-160,\"y\":-64},\"selected\":false},{\"id\":\"d9fc9494-696e-44a4-893f-daff10895476\",\"data\":{\"id\":\"carto-data.ac_ki5mm8fr.carto_openstreetmap_pointsofinterest_nodes_idn_latlon_v1_quarterly_v1\",\"name\":\"ReadTable\",\"type\":\"view\",\"label\":\"carto_openstreetmap_pointsofinterest_nodes_idn_latlon_v1_quarterly_v1\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-data.ac_ki5mm8fr.carto_openstreetmap_pointsofinterest_nodes_idn_latlon_v1_quarterly_v1\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-368,\"y\":256},\"selected\":false},{\"id\":\"e74238f0-1e8d-422c-87a8-1c1360131a33\",\"data\":{\"id\":\"carto-dw-ac-ki5mm8fr.shared.data_genangan_banjir_24\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"data_genangan_banjir_24\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.data_genangan_banjir_24\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-416,\"y\":-336},\"selected\":false},{\"id\":\"13e5a78e-190a-4f1a-8a10-4f02638327c0\",\"data\":{\"name\":\"native.unionall\",\"type\":\"generic\",\"label\":\"Union All\",\"inputs\":[{\"name\":\"tables\",\"type\":\"Table\",\"title\":\"Tables\",\"mode\":\"multiple\",\"description\":\"Tables\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":-144,\"y\":-336},\"selected\":false},{\"id\":\"9df398db-245b-482f-b5b0-3e6d75d2a300\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select *, 1 as count_genangan from `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":32,\"y\":-336},\"selected\":false},{\"id\":\"6039dc0d-8f77-4866-9607-d0a81e4dc6dd\",\"data\":{\"name\":\"native.enrichpolygons\",\"type\":\"generic\",\"label\":\"Enrich Polygons\",\"inputs\":[{\"name\":\"target\",\"type\":\"Table\",\"title\":\"Target polygons to be enriched\",\"placeholder\":\"FQN of the target table\",\"description\":\"Target polygons to be enriched\"},{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source for the enrichment\",\"placeholder\":\"FQN of the source table\"},{\"name\":\"target_col\",\"type\":\"Column\",\"title\":\"Target polygons geo column\",\"parent\":\"target\",\"dataType\":[\"geography\"],\"description\":\"Target polygons geo column\",\"value\":\"geom\"},{\"name\":\"source_col\",\"type\":\"Column\",\"title\":\"Source geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"optional\":false,\"description\":\"Source geo column\",\"value\":\"geom\"},{\"name\":\"variables\",\"type\":\"SelectColumnAggregation\",\"title\":\"Variables\",\"parent\":\"source\",\"noDefault\":true,\"doVariables\":true,\"description\":\"Comma-separated list of variable names and aggregation methods (e.g. population_93405ad7, sum, population_93405ad7, avg)\",\"placeholder\":\"population_93405ad7, sum, population_93405ad7, avg\",\"optional\":false,\"value\":\"count_genangan,sum\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":384,\"y\":-32},\"selected\":false},{\"id\":\"06c2a0d5-2e92-4ff0-a3f6-f92b2319a413\",\"data\":{\"name\":\"native.where\",\"type\":\"generic\",\"label\":\"Where\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"expression\",\"type\":\"StringSql\",\"title\":\"Filter expression\",\"placeholder\":\"E.g.: area > 1000 AND area < 3000\",\"description\":\"Filter expression\",\"value\":\"healthcare is not null\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":-80,\"y\":256},\"selected\":false},{\"id\":\"6041cef5-7f1c-4082-aaf7-ff02719178d7\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select *, 1 as count_faskes from `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":688,\"y\":-32},\"selected\":false},{\"id\":\"82bf9faa-7d57-4921-80f9-9bb872b92c96\",\"data\":{\"name\":\"native.enrichpolygons\",\"type\":\"generic\",\"label\":\"Enrich Polygons\",\"inputs\":[{\"name\":\"target\",\"type\":\"Table\",\"title\":\"Target polygons to be enriched\",\"placeholder\":\"FQN of the target table\",\"description\":\"Target polygons to be enriched\"},{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source for the enrichment\",\"placeholder\":\"FQN of the source table\"},{\"name\":\"target_col\",\"type\":\"Column\",\"title\":\"Target polygons geo column\",\"parent\":\"target\",\"dataType\":[\"geography\"],\"description\":\"Target polygons geo column\",\"value\":\"geom\"},{\"name\":\"source_col\",\"type\":\"Column\",\"title\":\"Source geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"optional\":false,\"description\":\"Source geo column\",\"value\":\"geom\"},{\"name\":\"variables\",\"type\":\"SelectColumnAggregation\",\"title\":\"Variables\",\"parent\":\"source\",\"noDefault\":true,\"doVariables\":true,\"description\":\"Comma-separated list of variable names and aggregation methods (e.g. population_93405ad7, sum, population_93405ad7, avg)\",\"placeholder\":\"population_93405ad7, sum, population_93405ad7, avg\",\"optional\":false,\"value\":\"count_faskes,sum\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":912,\"y\":-32},\"selected\":false},{\"id\":\"4ec414af-f72d-44b0-8068-40a05e1d7e02\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select *,\\n\\tcase when count_genangan_sum is null then 0\\n    \\telse count_genangan_sum\\n    end as count_genangan_final,\\n\\tcase when count_faskes_sum is null then 0\\n    \\telse count_faskes_sum\\n    end as count_faskes_final,\\n    case when count_pengungsian_sum is null then 0\\n    \\telse count_pengungsian_sum\\n    end as count_pengungsian_final\\nfrom `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1792,\"y\":-80},\"selected\":false},{\"id\":\"b97b1017-ee98-4161-bfea-7314ce841727\",\"data\":{\"id\":\"carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_10b9150b2428644b_Data_Pengungsian\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"Data_Pengungsian\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_10b9150b2428644b_Data_Pengungsian\",\"description\":\"Read Table\"}],\"importUrl\":null,\"autoguessing\":true,\"fromImportedFile\":true},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":1136,\"y\":-64},\"selected\":false},{\"id\":\"fd209854-ba81-4ce1-ba6c-64a965870244\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select *, 1 as count_pengungsian from `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1472,\"y\":16},\"selected\":false},{\"id\":\"ee06e5bb-4c4b-469c-b49f-87de4effcfb1\",\"data\":{\"name\":\"native.enrichpolygons\",\"type\":\"generic\",\"label\":\"Enrich Polygons\",\"inputs\":[{\"name\":\"target\",\"type\":\"Table\",\"title\":\"Target polygons to be enriched\",\"placeholder\":\"FQN of the target table\",\"description\":\"Target polygons to be enriched\"},{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source for the enrichment\",\"placeholder\":\"FQN of the source table\"},{\"name\":\"target_col\",\"type\":\"Column\",\"title\":\"Target polygons geo column\",\"parent\":\"target\",\"dataType\":[\"geography\"],\"description\":\"Target polygons geo column\",\"value\":\"geom\"},{\"name\":\"source_col\",\"type\":\"Column\",\"title\":\"Source geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"optional\":false,\"description\":\"Source geo column\",\"value\":\"geom\"},{\"name\":\"variables\",\"type\":\"SelectColumnAggregation\",\"title\":\"Variables\",\"parent\":\"source\",\"noDefault\":true,\"doVariables\":true,\"description\":\"Comma-separated list of variable names and aggregation methods (e.g. population_93405ad7, sum, population_93405ad7, avg)\",\"placeholder\":\"population_93405ad7, sum, population_93405ad7, avg\",\"optional\":false,\"value\":\"count_pengungsian,sum\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1632,\"y\":-80},\"selected\":false},{\"id\":\"c52f279d-2ecd-4949-809d-8239cb6b4ca8\",\"data\":{\"name\":\"native.intersection\",\"type\":\"generic\",\"label\":\"ST Intersection\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Polygons table\",\"description\":\"Polygons table\"},{\"name\":\"geosource\",\"type\":\"Column\",\"title\":\"Geo column in source table\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column in source table\",\"value\":\"geom\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in polygons table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in polygons table\",\"value\":\"geom\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":896,\"y\":304},\"selected\":false},{\"id\":\"97af9c18-2a2c-4692-8815-781b11534e92\",\"data\":{\"name\":\"native.refactorcolumns\",\"type\":\"generic\",\"label\":\"Edit Schema\",\"title\":\"formating\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"columns\",\"type\":\"SelectColumnType\",\"title\":\"Column name and type\",\"parent\":\"source\",\"noDefault\":true,\"providers\":[\"bigquery\",\"snowflake\",\"redshift\",\"postgres\"],\"description\":\"Column name and type\",\"value\":\"geom,geom,GEOGRAPHY\\nwadmkd,kelurahan,STRING\\nwadmkc,kecamatan,STRING\\nwadmkk,kota,STRING\\nfri25,fri25,BIGNUMERIC\\ntotal_informal_settlements,informal_settlements_rw_count,INT64\\naid_score,aid_score,FLOAT64\\nflood_class,flood_class,STRING\\naid_priority,aid_priority,STRING\\ncount_genangan_final,count_genangan,INT64\\ncount_faskes_final,count_faskes,INT64\\ncount_pengungsian_final,count_pengungsian,INT64\"}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2000,\"y\":-80},\"selected\":false},{\"id\":\"5fbbb017-aebb-4506-939c-a081657486e8\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.output_risk_kelurahan\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2144,\"y\":-80},\"selected\":false},{\"id\":\"444b05c1-c03c-461e-b1dc-444bdfa76b29\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select geom, geoid as id_faskes, all_tags, healthcare as healthcare_type, wadmkd_secondary  as kelurahan, wadmkc_secondary  as kecamatan, wadmkk_secondary  as kota, flood_class_secondary  as flood_class, aid_priority_secondary  as aid_priority from `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1088,\"y\":304},\"selected\":false},{\"id\":\"97e21376-46c7-4ffa-b0c4-d320c3dad554\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.data_titik_shelter\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1472,\"y\":-128},\"selected\":false},{\"id\":\"64c01126-35ca-442b-946c-3448866a5203\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select *, \\n  (\\n    SELECT tag.value\\n    FROM UNNEST(all_tags) AS tag\\n    WHERE tag.key = 'name'\\n  ) AS faskes_name,\\n    (\\n    SELECT tag.value\\n    FROM UNNEST(all_tags) AS tag\\n    WHERE tag.key = 'addr:street'\\n  ) AS faskes_address,\\nFROM `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1264,\"y\":304},\"selected\":false},{\"id\":\"62edb68e-a303-4a43-8558-589721a4e277\",\"data\":{\"name\":\"native.isnotnull\",\"type\":\"generic\",\"label\":\"Is not Null\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Column\",\"parent\":\"source\",\"dataType\":[\"string\",\"number\",\"geography\",\"boolean\"],\"description\":\"Column\",\"value\":\"faskes_name\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1408,\"y\":304},\"selected\":false},{\"id\":\"5e82bb6d-eba6-4e85-b1c4-0d9692d9674d\",\"data\":{\"name\":\"native.dropcolumn\",\"type\":\"generic\",\"label\":\"Drop Columns\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Columns to drop\",\"parent\":\"source\",\"mode\":\"multiple\",\"noDefault\":true,\"description\":\"Columns to drop\",\"value\":[\"all_tags\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1552,\"y\":304},\"selected\":false},{\"id\":\"eb3fe485-6a3e-4904-b838-87f262d3e5c0\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.output_faskes\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1712,\"y\":304},\"selected\":false},{\"id\":\"bba5a629-c833-46a0-89f2-51c4288cf777\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":607.9929999999999,\"height\":272,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Handle Data Genangan\\nPrepare floodwaters data for the next enrichment\",\"position\":{\"x\":-448,\"y\":-464}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-448,\"y\":-464}},{\"id\":\"74b3ac44-2327-4db2-9ae0-b44f4cd804f6\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":607.9979999999999,\"height\":239.994,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Get and Classify Flood Risk Data\\nClassify flood risk into 5 severity class\",\"position\":{\"x\":-448,\"y\":-176}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-448,\"y\":-176}},{\"id\":\"b2daef9a-2517-4699-94f8-2feb68970f1e\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":607.998,\"height\":335.998,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Retrieve Healthcare POI from OSM\\nfilter healthcare with name from OSM, those which have 'Null' value will be excluded\",\"position\":{\"x\":-448,\"y\":80}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-448,\"y\":80}},{\"id\":\"479db168-8944-4641-9a83-c53630284419\",\"data\":{\"name\":\"Note\",\"color\":\"#F89C74\",\"genAi\":false,\"label\":\"\",\"width\":424.4255042371482,\"height\":345.15537115005435,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Count floodwaters location in each kelurahan\\nTotal number of floodwaters location that fall inside each kelurahan. This will be useful to investigate severity and lack of healthcare and shelter property\"},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":192,\"y\":-224}},{\"id\":\"772bfd86-2898-4399-8d98-25593076cff4\",\"data\":{\"name\":\"Note\",\"color\":\"#F89C74\",\"genAi\":false,\"label\":\"\",\"width\":432,\"height\":351.996,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Count healthcare location in each kelurahan\\nThis is an example paragraph. You can write your text here. You can use *italic* or **bold** to highlight words.\",\"position\":{\"x\":624,\"y\":-224}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":624,\"y\":-224}},{\"id\":\"654856ee-9ea1-4e03-b732-ea21d7e832aa\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":1296,\"height\":335.996,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Reformat and prepare Healthcare location for map dashboard\\nPrepare healthcare location to be visualized with other layers in the dashboard later. In this step we will only use the one with names and address information\",\"position\":{\"x\":624,\"y\":144}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":624,\"y\":144}},{\"id\":\"f13c6093-f94c-4414-a51f-4fdeca4dd4bc\",\"data\":{\"name\":\"Note\",\"color\":\"#F89C74\",\"genAi\":false,\"label\":\"\",\"width\":847.99,\"height\":352,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Count shelter location in each kelurahan\\nSame as before, count total number of shelter in each kelurahan\",\"position\":{\"x\":1072,\"y\":-224}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1072,\"y\":-224}},{\"id\":\"cb139b86-42c1-4f6d-bd7d-e29edde1fafa\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":335.994,\"height\":351.99600000000004,\"inputs\":[],\"markdown\":\"---\\nlabel:\\n---\\n## Final output ✨\\nReformat final table and store in datawarehouse for future use\",\"position\":{\"x\":1936,\"y\":-224}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":1936,\"y\":-224}}],\"edges\":[{\"id\":\"c8c6f2c3-57ca-46cd-982d-be4f90f02ed4\",\"type\":\"default\",\"source\":\"e74238f0-1e8d-422c-87a8-1c1360131a33\",\"target\":\"13e5a78e-190a-4f1a-8a10-4f02638327c0\",\"sourceHandle\":\"out\",\"targetHandle\":\"tables\",\"animated\":false},{\"id\":\"13e5a78e-190a-4f1a-8a10-4f02638327c0result-9df398db-245b-482f-b5b0-3e6d75d2a300sourceb\",\"source\":\"13e5a78e-190a-4f1a-8a10-4f02638327c0\",\"target\":\"9df398db-245b-482f-b5b0-3e6d75d2a300\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"f6d29943-1640-4379-81d4-d790e6a35a64\",\"type\":\"default\",\"source\":\"1021df61-f8a8-4193-be5d-5abbacc15c9d\",\"target\":\"6039dc0d-8f77-4866-9607-d0a81e4dc6dd\",\"sourceHandle\":\"result\",\"targetHandle\":\"target\",\"animated\":false},{\"id\":\"dcad314d-af3c-4647-8d86-ef7854936a3c\",\"type\":\"default\",\"source\":\"9df398db-245b-482f-b5b0-3e6d75d2a300\",\"target\":\"6039dc0d-8f77-4866-9607-d0a81e4dc6dd\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"3c8586ad-e667-46ef-af5f-3d3cbaee856e\",\"type\":\"default\",\"source\":\"d9fc9494-696e-44a4-893f-daff10895476\",\"target\":\"06c2a0d5-2e92-4ff0-a3f6-f92b2319a413\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"eccde101-9be3-4534-a981-2713782e79ff\",\"type\":\"default\",\"source\":\"06c2a0d5-2e92-4ff0-a3f6-f92b2319a413\",\"target\":\"6041cef5-7f1c-4082-aaf7-ff02719178d7\",\"sourceHandle\":\"match\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"a09ebd80-d633-4077-baca-d3551be64882\",\"type\":\"default\",\"source\":\"6039dc0d-8f77-4866-9607-d0a81e4dc6dd\",\"target\":\"82bf9faa-7d57-4921-80f9-9bb872b92c96\",\"sourceHandle\":\"result\",\"targetHandle\":\"target\",\"animated\":false},{\"id\":\"23386cc0-7792-4601-b63b-1a36b9bd3707\",\"type\":\"default\",\"source\":\"6041cef5-7f1c-4082-aaf7-ff02719178d7\",\"target\":\"82bf9faa-7d57-4921-80f9-9bb872b92c96\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"b97b1017-ee98-4161-bfea-7314ce841727out-fd209854-ba81-4ce1-ba6c-64a965870244sourceb\",\"source\":\"b97b1017-ee98-4161-bfea-7314ce841727\",\"target\":\"fd209854-ba81-4ce1-ba6c-64a965870244\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"c273ee68-6d97-47d7-a7a2-135d307d8d86\",\"type\":\"default\",\"source\":\"fd209854-ba81-4ce1-ba6c-64a965870244\",\"target\":\"ee06e5bb-4c4b-469c-b49f-87de4effcfb1\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"a1ea76b8-2416-45d0-ac1b-f00c16ac74ca\",\"type\":\"default\",\"source\":\"82bf9faa-7d57-4921-80f9-9bb872b92c96\",\"target\":\"ee06e5bb-4c4b-469c-b49f-87de4effcfb1\",\"sourceHandle\":\"result\",\"targetHandle\":\"target\",\"animated\":false},{\"id\":\"5d8d4aa8-f9bb-42fe-85bb-8be929f13486\",\"type\":\"default\",\"source\":\"ee06e5bb-4c4b-469c-b49f-87de4effcfb1\",\"target\":\"4ec414af-f72d-44b0-8068-40a05e1d7e02\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"074e90be-d6d4-47ff-9cf2-865f65b07807\",\"type\":\"default\",\"source\":\"6041cef5-7f1c-4082-aaf7-ff02719178d7\",\"target\":\"c52f279d-2ecd-4949-809d-8239cb6b4ca8\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"b26f5a31-b6d1-4aa5-b260-ee46d3650fb8\",\"type\":\"default\",\"source\":\"1021df61-f8a8-4193-be5d-5abbacc15c9d\",\"target\":\"c52f279d-2ecd-4949-809d-8239cb6b4ca8\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondary\",\"animated\":false},{\"id\":\"34cdea35-6ed4-42d8-a66c-5a8aa1cbc86a\",\"type\":\"default\",\"source\":\"4ec414af-f72d-44b0-8068-40a05e1d7e02\",\"target\":\"97af9c18-2a2c-4692-8815-781b11534e92\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"97af9c18-2a2c-4692-8815-781b11534e92result-5fbbb017-aebb-4506-939c-a081657486e8source\",\"source\":\"97af9c18-2a2c-4692-8815-781b11534e92\",\"target\":\"5fbbb017-aebb-4506-939c-a081657486e8\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"afdd1100-8f96-49ae-93dd-3fee39b06f34\",\"type\":\"default\",\"source\":\"c52f279d-2ecd-4949-809d-8239cb6b4ca8\",\"target\":\"444b05c1-c03c-461e-b1dc-444bdfa76b29\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"ffc9004f-646e-4963-961f-756f450bd8cf\",\"type\":\"default\",\"source\":\"b97b1017-ee98-4161-bfea-7314ce841727\",\"target\":\"97e21376-46c7-4ffa-b0c4-d320c3dad554\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"444b05c1-c03c-461e-b1dc-444bdfa76b29result-64c01126-35ca-442b-946c-3448866a5203sourceb\",\"source\":\"444b05c1-c03c-461e-b1dc-444bdfa76b29\",\"target\":\"64c01126-35ca-442b-946c-3448866a5203\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"64c01126-35ca-442b-946c-3448866a5203result-62edb68e-a303-4a43-8558-589721a4e277source\",\"source\":\"64c01126-35ca-442b-946c-3448866a5203\",\"target\":\"62edb68e-a303-4a43-8558-589721a4e277\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"62edb68e-a303-4a43-8558-589721a4e277match-5e82bb6d-eba6-4e85-b1c4-0d9692d9674dsource\",\"source\":\"62edb68e-a303-4a43-8558-589721a4e277\",\"target\":\"5e82bb6d-eba6-4e85-b1c4-0d9692d9674d\",\"sourceHandle\":\"match\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"5e82bb6d-eba6-4e85-b1c4-0d9692d9674dresult-eb3fe485-6a3e-4904-b838-87f262d3e5c0source\",\"source\":\"5e82bb6d-eba6-4e85-b1c4-0d9692d9674d\",\"target\":\"eb3fe485-6a3e-4904-b838-87f262d3e5c0\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":399.31904855259654,\"y\":358.60337719643206,\"zoom\":0.5904522343803782},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":false}"}
  */
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_bad9d3da6f5c342c_result`
  AS
    with floodrisk as (select a.geom, a.wadmkd, a.wadmkc, a.wadmkk, b.fri25 from `carto-dw-ac-ki5mm8fr.shared.data_kelurahan_neighborhood` a
    inner join `carto-dw-ac-ki5mm8fr.shared.data_kelurahan_floodpredictions_2025_2045` b on a.wadmkd = b.wadmkd),
    informal as (
      select a.*, c.total as total_informal_settlements,
        case 
          when fri25 >0 and fri25 <= 0.01 then "Risiko Sangat Rendah"
          when fri25 >0.01 and fri25 <= 4.05 then "Risiko Rendah"
          when fri25 >4.05 and fri25 <= 12.31 then "Risiko Medium" 
          when fri25 >12.31 and fri25 <= 32.06 then "Risiko Tinggi" 
          when fri25 >32.06 then "Sangat Tinggi" 
        end as flood_class
      from floodrisk a
      inner join 
      carto-dw-ac-ki5mm8fr.shared.data_kelurahan_residencelivingininformalsettlements c
      on a.wadmkd = c.wadmkd),
    norm as (
      select *,
        ML.MIN_MAX_SCALER(fri25) OVER() as fri25_norm,
        ML.MIN_MAX_SCALER(total_informal_settlements) OVER() as total_informal_settlements_norm,
      from informal),
    calculate_score as ( 
      select *,
        (fri25_norm * 0.5) + (total_informal_settlements_norm * 0.5) as aid_score
      from norm)
    select *, 
      case 
        when  aid_score > 0 and aid_score <= 0.03 then "Very Low Priority"
        when  aid_score > 0.03 and aid_score <= 0.09 then "Low Priority"
        when  aid_score > 0.09 and aid_score <= 0.15 then "Medium Priority"
        when  aid_score > 0.15 and aid_score <= 0.25 then "High Priority"
        when  aid_score > 0.25 and aid_score <= 0.75 then "Very High Priority"
      end as aid_priority
    from calculate_score
    ;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-ki5mm8fr.shared.data_titik_shelter';
  BEGIN
  EXECUTE IMMEDIATE
  REPLACE(
    '''DROP TABLE IF EXISTS `####`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TABLE IF NOT EXISTS `####`
    CLONE `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_10b9150b2428644b_Data_Pengungsian`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_5c3311de39c819c9_result`
    AS
      SELECT * FROM `####`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_d247ad506cd9d8d7_result`
  AS
    SELECT geom, no_, no__per_ta, tahun, tanggal_ke, lokasi, wilayah, tinggi_gen, tg_min, tg_max, kategori_p, penyebab, lintang, bujur FROM `carto-dw-ac-ki5mm8fr.shared.data_genangan_banjir_24`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_96f82fbfe0825776_match`
  AS
    SELECT *
    FROM `carto-data.ac_ki5mm8fr.carto_openstreetmap_pointsofinterest_nodes_idn_latlon_v1_quarterly_v1`
    WHERE healthcare is not null;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_31c8913cfc3709bf_result`
  AS
    select *, 1 as count_pengungsian from `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_10b9150b2428644b_Data_Pengungsian`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_6caeb1fc9110a89a_result`
  AS
    select *, 1 as count_genangan from `WORKFLOW_10b9150b2428644b_d247ad506cd9d8d7_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_6520aa6aae970fbc_result`
  AS
    select *, 1 as count_faskes from `WORKFLOW_10b9150b2428644b_96f82fbfe0825776_match`;
  END;
  BEGIN
  DECLARE alias STRING;
  CREATE TABLE `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.table_37442160_fa1f_478a_b042_455534f6c588` AS
  SELECT * FROM `WORKFLOW_10b9150b2428644b_bad9d3da6f5c342c_result`
  WHERE 1=0;
  EXECUTE IMMEDIATE
  '''
    with __alias AS(
      SELECT CONCAT(
        'b.', column_name, ' AS ', column_name, '_secondary'
      ) col_alias
      FROM `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b`.INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'table_37442160_fa1f_478a_b042_455534f6c588'
    )
    SELECT STRING_AGG(col_alias, ', ')
    FROM __alias
  '''
  INTO alias;
  DROP TABLE `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.table_37442160_fa1f_478a_b042_455534f6c588`;
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_11c26f9084c3d5ba_result`
    AS
      SELECT
        ST_INTERSECTION(
          b.geom,
          a.geom
        )
      AS intersection_geom_geom,
        a.*, %s
      FROM `WORKFLOW_10b9150b2428644b_6520aa6aae970fbc_result` AS a
      JOIN `WORKFLOW_10b9150b2428644b_bad9d3da6f5c342c_result` AS b
      ON ST_INTERSECTS(
        b.geom,
        a.geom
      )''',
    '%s',
    alias
  );
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_0c7c98d952117781_result`
  AS
    select geom, geoid as id_faskes, all_tags, healthcare as healthcare_type, wadmkd_secondary  as kelurahan, wadmkc_secondary  as kecamatan, wadmkk_secondary  as kota, flood_class_secondary  as flood_class, aid_priority_secondary  as aid_priority from `WORKFLOW_10b9150b2428644b_11c26f9084c3d5ba_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_8529f39419bc5b8a_result`
  AS
    select *, 
      (
        SELECT tag.value
        FROM UNNEST(all_tags) AS tag
        WHERE tag.key = 'name'
      ) AS faskes_name,
        (
        SELECT tag.value
        FROM UNNEST(all_tags) AS tag
        WHERE tag.key = 'addr:street'
      ) AS faskes_address,
    FROM `WORKFLOW_10b9150b2428644b_0c7c98d952117781_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_71de1cb14fb4fa9a_match`
  AS
    SELECT *
    FROM `WORKFLOW_10b9150b2428644b_8529f39419bc5b8a_result`
    WHERE faskes_name IS NOT NULL;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_809a7682e39513b7_result`
  AS
    SELECT * EXCEPT (all_tags)
    FROM `WORKFLOW_10b9150b2428644b_71de1cb14fb4fa9a_match`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-ki5mm8fr.shared.output_faskes';
  BEGIN
  EXECUTE IMMEDIATE
  REPLACE(
    '''DROP TABLE IF EXISTS `####`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TABLE IF NOT EXISTS `####`
    CLONE `WORKFLOW_10b9150b2428644b_809a7682e39513b7_result`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_55e65d85dffb1f6f_result`
    AS
      SELECT * FROM `####`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
  BEGIN
  DECLARE tempInputTable STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTable STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTableKring STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTableKringRenamed STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TABLE IF NOT EXISTS `##tablename##`
    OPTIONS (
      expiration_timestamp = TIMESTAMP_ADD(
        CURRENT_TIMESTAMP(), INTERVAL 30 DAY
      )
    )
    AS
      SELECT * FROM `WORKFLOW_10b9150b2428644b_bad9d3da6f5c342c_result`''',
    '##tablename##',
    tempInputTable
  );
  CALL `carto-un.carto`.ENRICH_POLYGONS(
    tempInputTable,
    'geom',
    'SELECT * FROM `WORKFLOW_10b9150b2428644b_6caeb1fc9110a89a_result`',
    'geom',
    [('count_genangan', 'sum')],
    [tempOutputTable]
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_007825063743cb4c_result`
    AS
      SELECT * FROM `##tablename##`''',
    '##tablename##',
    tempOutputTable
  );
  END;
  END;
  BEGIN
  BEGIN
  DECLARE tempInputTable STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTable STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTableKring STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTableKringRenamed STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TABLE IF NOT EXISTS `##tablename##`
    OPTIONS (
      expiration_timestamp = TIMESTAMP_ADD(
        CURRENT_TIMESTAMP(), INTERVAL 30 DAY
      )
    )
    AS
      SELECT * FROM `WORKFLOW_10b9150b2428644b_007825063743cb4c_result`''',
    '##tablename##',
    tempInputTable
  );
  CALL `carto-un.carto`.ENRICH_POLYGONS(
    tempInputTable,
    'geom',
    'SELECT * FROM `WORKFLOW_10b9150b2428644b_6520aa6aae970fbc_result`',
    'geom',
    [('count_faskes', 'sum')],
    [tempOutputTable]
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_1ca4cf5440b2f38a_result`
    AS
      SELECT * FROM `##tablename##`''',
    '##tablename##',
    tempOutputTable
  );
  END;
  END;
  BEGIN
  BEGIN
  DECLARE tempInputTable STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTable STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTableKring STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  DECLARE tempOutputTableKringRenamed STRING DEFAULT 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.' || REPLACE(GENERATE_UUID(), '-', '_');
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TABLE IF NOT EXISTS `##tablename##`
    OPTIONS (
      expiration_timestamp = TIMESTAMP_ADD(
        CURRENT_TIMESTAMP(), INTERVAL 30 DAY
      )
    )
    AS
      SELECT * FROM `WORKFLOW_10b9150b2428644b_1ca4cf5440b2f38a_result`''',
    '##tablename##',
    tempInputTable
  );
  CALL `carto-un.carto`.ENRICH_POLYGONS(
    tempInputTable,
    'geom',
    'SELECT * FROM `WORKFLOW_10b9150b2428644b_31c8913cfc3709bf_result`',
    'geom',
    [('count_pengungsian', 'sum')],
    [tempOutputTable]
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_8e3379138820099c_result`
    AS
      SELECT * FROM `##tablename##`''',
    '##tablename##',
    tempOutputTable
  );
  END;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_591ac72d474ec858_result`
  AS
    select *,
    	case when count_genangan_sum is null then 0
        	else count_genangan_sum
        end as count_genangan_final,
    	case when count_faskes_sum is null then 0
        	else count_faskes_sum
        end as count_faskes_final,
        case when count_pengungsian_sum is null then 0
        	else count_pengungsian_sum
        end as count_pengungsian_final
    from `WORKFLOW_10b9150b2428644b_8e3379138820099c_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_7dad29eaf7767043_result`
  AS
    SELECT
      SAFE_CAST(geom AS GEOGRAPHY) AS geom,
      SAFE_CAST(wadmkd AS STRING) AS kelurahan,
      SAFE_CAST(wadmkc AS STRING) AS kecamatan,
      SAFE_CAST(wadmkk AS STRING) AS kota,
      SAFE_CAST(fri25 AS BIGNUMERIC) AS fri25,
      SAFE_CAST(total_informal_settlements AS INT64) AS informal_settlements_rw_count,
      SAFE_CAST(aid_score AS FLOAT64) AS aid_score,
      SAFE_CAST(flood_class AS STRING) AS flood_class,
      SAFE_CAST(aid_priority AS STRING) AS aid_priority,
      SAFE_CAST(count_genangan_final AS INT64) AS count_genangan,
      SAFE_CAST(count_faskes_final AS INT64) AS count_faskes,
      SAFE_CAST(count_pengungsian_final AS INT64) AS count_pengungsian
    FROM `WORKFLOW_10b9150b2428644b_591ac72d474ec858_result`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-ki5mm8fr.shared.output_risk_kelurahan';
  BEGIN
  EXECUTE IMMEDIATE
  REPLACE(
    '''DROP TABLE IF EXISTS `####`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TABLE IF NOT EXISTS `####`
    CLONE `WORKFLOW_10b9150b2428644b_7dad29eaf7767043_result`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_10b9150b2428644b_8859a79fa9f5a429_result`
    AS
      SELECT * FROM `####`''',
    '####',
    __destination
  );
  END;
  END;
END;