-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: carto-un.carto. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_03297008558afb3a`(
)
BEGIN
  /*
   {"versionId":"46f2eea8a50974e8","paramsId":"97d170e1550eee4a","isImmutable":false,"diagramJson":"{\"title\":\"analisis h3 level\",\"description\":\"\",\"nodes\":[{\"id\":\"01644727-3139-4b56-b706-5d189cad6429\",\"data\":{\"id\":\"carto-dw-ac-ki5mm8fr.shared.data_kelurahan_neighborhood\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"data_kelurahan_neighborhood\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.data_kelurahan_neighborhood\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":112,\"y\":112},\"selected\":false},{\"id\":\"965d21c8-aa3f-4b0b-96b3-a271a03eaa6c\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select geom, wadmkc, wadmkd, wadmkk from `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":416,\"y\":112},\"selected\":false},{\"id\":\"2b2a65f4-1985-4d35-9ff4-c18a83841131\",\"data\":{\"name\":\"native.h3polyfill\",\"type\":\"generic\",\"label\":\"H3 Polyfill\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"geom\"},{\"name\":\"resolution\",\"type\":\"Number\",\"title\":\"Resolution\",\"helper\":\"Hexagon edge length: 2=182km | 6=4km | 10=76m | 14=1.5m\",\"min\":0,\"max\":15,\"default\":8,\"mode\":\"slider\",\"description\":\"Resolution\",\"value\":11},{\"name\":\"aggregate\",\"type\":\"Boolean\",\"title\":\"Aggregate H3 cells\",\"default\":false,\"helper\":\"If false, the result will include the original columns from the input source\",\"description\":\"Aggregate H3 cells\",\"value\":false},{\"name\":\"includegeocolumns\",\"type\":\"Boolean\",\"title\":\"Include geo columns\",\"default\":false,\"helper\":\"If true, the result will include the original geo column(s)\",\"showIf\":[{\"value\":false,\"parameter\":\"aggregate\"}],\"description\":\"Include geo columns\",\"value\":false},{\"name\":\"mode\",\"type\":\"Selection\",\"title\":\"Mode\",\"options\":[\"center\",\"intersects\",\"contains\"],\"default\":\"center\",\"mode\":\"toggle\",\"providers\":[\"postgres\",\"bigquery\"],\"description\":\"Mode\",\"value\":\"intersects\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":608,\"y\":112},\"selected\":false},{\"id\":\"0679a094-f974-4e7d-b010-13036bb72aca\",\"data\":{\"id\":\"carto-dw-ac-ki5mm8fr.shared.data_genangan_banjir_24\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"data_genangan_banjir_24\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.data_genangan_banjir_24\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":432,\"y\":272},\"selected\":false},{\"id\":\"1e1781f7-56d6-40a0-91b8-fe92dc8c0054\",\"data\":{\"name\":\"native.h3center\",\"type\":\"generic\",\"label\":\"H3 Center\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"h3col\",\"type\":\"Column\",\"title\":\"H3 column\",\"parent\":\"source\",\"placeholder\":\"h3\",\"dataType\":[\"string\"],\"description\":\"H3 column\",\"value\":\"h3\"}],\"version\":\"1.1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":784,\"y\":112},\"selected\":false},{\"id\":\"fee10622-f22d-4bbc-b7b6-18a24412f117\",\"data\":{\"name\":\"native.distance\",\"type\":\"generic\",\"label\":\"Distance to nearest\",\"title\":\"genangan within 2500m\",\"inputs\":[{\"name\":\"main\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"geomain\",\"type\":\"Column\",\"title\":\"Geo column in main table\",\"parent\":\"main\",\"dataType\":[\"geography\"],\"description\":\"Geo column in main table\",\"value\":\"h3_geom\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in secondary table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in secondary table\",\"value\":\"geom\"},{\"name\":\"idmain\",\"type\":\"Column\",\"title\":\"Id column in main table\",\"parent\":\"main\",\"description\":\"Id column in main table\",\"value\":\"h3\"},{\"name\":\"idsecondary\",\"type\":\"Column\",\"title\":\"Id column in secondary table\",\"parent\":\"secondary\",\"description\":\"Id column in secondary table\",\"value\":\"id\"},{\"name\":\"radius\",\"type\":\"Number\",\"title\":\"Radius\",\"min\":0,\"description\":\"Radius\",\"value\":2500},{\"name\":\"units\",\"type\":\"Selection\",\"title\":\"Units\",\"options\":[\"Meters\",\"Miles\"],\"default\":\"Meters\",\"description\":\"Units\",\"value\":\"Meters\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1024,\"y\":96},\"selected\":false},{\"id\":\"35c71bd5-bfbe-4b4b-a115-db04585fdeb7\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"with formating as (select * except (nearest_id, nearest_distance), nearest_id as nearest_id_genangan, nearest_distance as nearest_distance_genangan from `$b`)\\n\\nselect b.*, a.tanggal_ke as genangan_tanggal, a.lokasi as genangan_lokasi, a.wilayah as genangan_wilayah, a.tinggi_gen as genangan_tinggi_meter, a.kategori_p as  genangan_kategori\\n\\nfrom formating b inner join `$a` a on b.nearest_id_genangan = a.id\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1216,\"y\":160},\"selected\":false},{\"id\":\"87916c97-d030-4b79-882e-be1f6609626d\",\"data\":{\"id\":\"carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_03297008558afb3a_Data_Pengungsian\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"Data_Pengungsian\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_03297008558afb3a_Data_Pengungsian\",\"description\":\"Read Table\"}],\"importUrl\":null,\"autoguessing\":true,\"fromImportedFile\":true},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":432,\"y\":384},\"selected\":false},{\"id\":\"4834ca67-a677-466b-bb1b-0eee48125ac5\",\"data\":{\"name\":\"native.distance\",\"type\":\"generic\",\"label\":\"Distance to nearest\",\"inputs\":[{\"name\":\"main\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"geomain\",\"type\":\"Column\",\"title\":\"Geo column in main table\",\"parent\":\"main\",\"dataType\":[\"geography\"],\"description\":\"Geo column in main table\",\"value\":\"h3_geom\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in secondary table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in secondary table\",\"value\":\"geom\"},{\"name\":\"idmain\",\"type\":\"Column\",\"title\":\"Id column in main table\",\"parent\":\"main\",\"description\":\"Id column in main table\",\"value\":\"h3\"},{\"name\":\"idsecondary\",\"type\":\"Column\",\"title\":\"Id column in secondary table\",\"parent\":\"secondary\",\"description\":\"Id column in secondary table\",\"value\":\"id\"},{\"name\":\"radius\",\"type\":\"Number\",\"title\":\"Radius\",\"min\":0,\"description\":\"Radius\",\"value\":10000},{\"name\":\"units\",\"type\":\"Selection\",\"title\":\"Units\",\"options\":[\"Meters\",\"Miles\"],\"default\":\"Meters\",\"description\":\"Units\",\"value\":\"Meters\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1408,\"y\":208},\"selected\":false},{\"id\":\"3f0b7262-4368-4f45-9edb-f51594dd56a8\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select * except (nearest_id, nearest_distance), nearest_id as nearest_id_pengungsian, nearest_distance as nearest_distance_pengungsian from `$b`\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1616,\"y\":208},\"selected\":false},{\"id\":\"5adb1ad5-3966-4a4f-8a96-2db1ff24d818\",\"data\":{\"name\":\"native.generateuuid\",\"type\":\"generic\",\"label\":\"Generate UUID\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":736,\"y\":288},\"selected\":false},{\"id\":\"21b7ac79-a1d1-4d02-8789-90c734c5aa63\",\"data\":{\"name\":\"native.generateuuid\",\"type\":\"generic\",\"label\":\"Generate UUID\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":848,\"y\":384},\"selected\":false},{\"id\":\"a92bfe91-51ed-4e5d-ae17-0d17658787f1\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"SELECT *, \\n  CONCAT(nama_lokasi, ', ', kelurahan, ', ', kecamatan, ', ', kota) AS name_pengungsian\\nFROM `$b`\\n\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1040,\"y\":432},\"selected\":false},{\"id\":\"d4836f8b-54d9-4814-aa14-650017f0decf\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select a.*, b.name_pengungsian from `$a` a \\ninner join `$b` b on a.nearest_id_pengungsian = b.id  \\n\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":1856,\"y\":288},\"selected\":false},{\"id\":\"ce8174d0-abb0-48da-959a-c7514594724e\",\"data\":{\"id\":\"carto-dw-ac-ki5mm8fr.shared.output_risk_kelurahan\",\"name\":\"ReadTable\",\"type\":\"table\",\"label\":\"output_risk_kelurahan\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.output_risk_kelurahan\",\"description\":\"Read Table\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":1680,\"y\":448},\"selected\":false},{\"id\":\"b4aed1bb-518f-42cd-a53e-2a6609cdd30f\",\"data\":{\"name\":\"native.select\",\"type\":\"generic\",\"label\":\"Select\",\"inputs\":[{\"name\":\"table\",\"type\":\"Table\",\"title\":\"Source table\",\"optional\":true,\"description\":\"Source table\"},{\"name\":\"select\",\"type\":\"StringSql\",\"title\":\"SELECT statement\",\"placeholder\":\"E.g.: *, distance_in_km * 1000 AS distance_in_meters\",\"allowExpressions\":false,\"description\":\"SELECT statement\",\"value\":\"geom, flood_class\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2016,\"y\":448},\"selected\":false},{\"id\":\"73b91498-ecaa-4b07-8e42-527a5ee93364\",\"data\":{\"name\":\"native.intersection\",\"type\":\"generic\",\"label\":\"ST Intersection\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Polygons table\",\"description\":\"Polygons table\"},{\"name\":\"geosource\",\"type\":\"Column\",\"title\":\"Geo column in source table\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column in source table\",\"value\":\"h3_geom\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in polygons table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in polygons table\",\"value\":\"geom\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2192,\"y\":352},\"selected\":false},{\"id\":\"c67755a0-a52c-49e8-9586-4d3acaeba8a7\",\"data\":{\"name\":\"native.dropcolumn\",\"type\":\"generic\",\"label\":\"Drop Columns\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"column\",\"type\":\"Column\",\"title\":\"Columns to drop\",\"parent\":\"source\",\"mode\":\"multiple\",\"noDefault\":true,\"description\":\"Columns to drop\",\"value\":[\"geom_secondary\"]}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2368,\"y\":352},\"selected\":false},{\"id\":\"6133dab1-64b4-41fa-8a6e-263f89f3aa73\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select * except(flood_class_secondary, intersection_h3_geom_geom), flood_class_secondary as flood_class from `$b` \"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2576,\"y\":352},\"selected\":false},{\"id\":\"6cd17ccc-c65f-4a0f-b505-a62dc7b6bfe4\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.output_risk_h3\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2816,\"y\":272},\"selected\":false},{\"id\":\"8428cbb3-cc2e-405e-998b-9da0bcb9ee5c\",\"data\":{\"name\":\"native.refactorcolumns\",\"type\":\"generic\",\"label\":\"Edit Schema\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"columns\",\"type\":\"SelectColumnType\",\"title\":\"Column name and type\",\"parent\":\"source\",\"noDefault\":true,\"providers\":[\"bigquery\",\"snowflake\",\"redshift\",\"postgres\"],\"description\":\"Column name and type\",\"value\":\"h3,h3,STRING\\nwadmkd,kelurahan,STRING\\nwadmkc,kecamatan,STRING\\nwadmkk,kota,STRING\\nnearest_distance_genangan,genangan_distance_m,FLOAT64\\ngenangan_tanggal,genangan_tanggal,DATE\\ngenangan_lokasi,genangan_lokasi,STRING\\ngenangan_wilayah,genangan_wilayah,STRING\\ngenangan_tinggi_meter,genangan_tinggi_meter,STRING\\ngenangan_kategori,genangan_kategori,STRING\\nnearest_distance_pengungsian,pengungsian_distance_m,FLOAT64\\nname_pengungsian,pengungsian_name,STRING\\nflood_class,flood_class,STRING\"}],\"version\":\"2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":2768,\"y\":496},\"selected\":false},{\"id\":\"49770e8b-c73e-44d3-8a7f-e80363efec6c\",\"data\":{\"name\":\"native.saveastable\",\"type\":\"generic\",\"label\":\"Save as Table\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"destination\",\"type\":\"OutputTable\",\"title\":\"Table details\",\"placeholder\":\"Rename and select destination\",\"description\":\"Table details\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.output_risk_h3_format\"},{\"name\":\"append\",\"type\":\"Boolean\",\"title\":\"Append to existing table\",\"default\":false,\"description\":\"Append to existing table\",\"value\":false},{\"name\":\"optimizationcol\",\"type\":\"Column\",\"title\":\"Cluster by\",\"parent\":\"source\",\"dataType\":[\"geography\",\"boolean\",\"number\",\"string\",\"date\",\"datetime\",\"time\",\"timestamp\"],\"providers\":[\"bigquery\"],\"optional\":true,\"advanced\":true,\"description\":\"Cluster by\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":3312,\"y\":640},\"selected\":false},{\"id\":\"c5c5016c-7135-4e90-8919-3b21ff5bcb96\",\"type\":\"source\",\"data\":{\"name\":\"ReadTable\",\"label\":\"output_faskes\",\"id\":\"carto-dw-ac-ki5mm8fr.shared.output_faskes\",\"type\":\"table\",\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"description\":\"Read Table\",\"title\":\"Source table\",\"value\":\"carto-dw-ac-ki5mm8fr.shared.output_faskes\"}]},\"position\":{\"x\":2304,\"y\":736},\"zIndex\":2,\"selected\":false},{\"id\":\"b4d114ca-9fb9-4f63-a3c3-e105c8ba4d7d\",\"type\":\"generic\",\"data\":{\"type\":\"generic\",\"label\":\"Distance to nearest\",\"name\":\"native.distance\",\"inputs\":[{\"name\":\"main\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondary\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"geomain\",\"type\":\"Column\",\"title\":\"Geo column in main table\",\"parent\":\"main\",\"dataType\":[\"geography\"],\"description\":\"Geo column in main table\",\"value\":\"h3_geom\"},{\"name\":\"geosecondary\",\"type\":\"Column\",\"title\":\"Geo column in secondary table\",\"parent\":\"secondary\",\"dataType\":[\"geography\"],\"description\":\"Geo column in secondary table\",\"value\":\"geom\"},{\"name\":\"idmain\",\"type\":\"Column\",\"title\":\"Id column in main table\",\"parent\":\"main\",\"description\":\"Id column in main table\",\"value\":\"h3\"},{\"name\":\"idsecondary\",\"type\":\"Column\",\"title\":\"Id column in secondary table\",\"parent\":\"secondary\",\"description\":\"Id column in secondary table\",\"value\":\"id_faskes\"},{\"name\":\"radius\",\"type\":\"Number\",\"title\":\"Radius\",\"min\":0,\"description\":\"Radius\",\"value\":10000},{\"name\":\"units\",\"type\":\"Selection\",\"title\":\"Units\",\"options\":[\"Meters\",\"Miles\"],\"default\":\"Meters\",\"description\":\"Units\",\"value\":\"Meters\"}],\"version\":\"1\"},\"position\":{\"x\":2768,\"y\":640},\"zIndex\":2,\"selected\":false},{\"id\":\"f3702a0d-239b-4c00-8c6e-23e6ae2d73ae\",\"type\":\"generic\",\"data\":{\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"name\":\"native.customsql\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"with reformat as (select * except (nearest_id, nearest_distance), nearest_id as nearest_id_faskes, nearest_distance as nearest_distance_faskes from `$b`)\\n\\nselect a.*, b.faskes_name from reformat a\\nleft join `carto-dw-ac-ki5mm8fr.shared.output_faskes` b on a.nearest_id_faskes = b.id_faskes\"}],\"version\":\"2.0.0\"},\"position\":{\"x\":2960,\"y\":640},\"zIndex\":2,\"selected\":false},{\"id\":\"b33612da-fe4f-4694-af8e-ecefe7d00608\",\"type\":\"generic\",\"data\":{\"name\":\"native.refactorcolumns\",\"type\":\"generic\",\"label\":\"Edit Schema\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"columns\",\"type\":\"SelectColumnType\",\"title\":\"Column name and type\",\"parent\":\"source\",\"noDefault\":true,\"providers\":[\"bigquery\",\"snowflake\",\"redshift\",\"postgres\"],\"description\":\"Column name and type\",\"value\":\"h3,h3,STRING\\nwadmkd,kelurahan,STRING\\nwadmkc,kecamatan,STRING\\nwadmkk,kota,STRING\\nnearest_distance_genangan,genangan_distance_m,FLOAT64\\ngenangan_tanggal,genangan_tanggal,DATE\\ngenangan_lokasi,genangan_lokasi,STRING\\ngenangan_wilayah,genangan_wilayah,STRING\\ngenangan_tinggi_meter,genangan_tinggi_meter,STRING\\ngenangan_kategori,genangan_kategori,STRING\\nnearest_distance_pengungsian,pengungsian_distance_m,FLOAT64\\nname_pengungsian,pengungsian_name,STRING\\nnearest_distance_faskes,faskes_distance_m,FLOAT64\\nfaskes_name,faskes_name,STRING\\nflood_class,flood_class,STRING\"}],\"version\":\"2\"},\"position\":{\"x\":3136,\"y\":640},\"zIndex\":2,\"selected\":false}],\"edges\":[{\"id\":\"01644727-3139-4b56-b706-5d189cad6429out-965d21c8-aa3f-4b0b-96b3-a271a03eaa6csourceb\",\"source\":\"01644727-3139-4b56-b706-5d189cad6429\",\"target\":\"965d21c8-aa3f-4b0b-96b3-a271a03eaa6c\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"965d21c8-aa3f-4b0b-96b3-a271a03eaa6cresult-2b2a65f4-1985-4d35-9ff4-c18a83841131source\",\"source\":\"965d21c8-aa3f-4b0b-96b3-a271a03eaa6c\",\"target\":\"2b2a65f4-1985-4d35-9ff4-c18a83841131\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"2b2a65f4-1985-4d35-9ff4-c18a83841131result-1e1781f7-56d6-40a0-91b8-fe92dc8c0054source\",\"source\":\"2b2a65f4-1985-4d35-9ff4-c18a83841131\",\"target\":\"1e1781f7-56d6-40a0-91b8-fe92dc8c0054\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"59f34aa4-5c89-4aff-9364-02ce365333d4\",\"type\":\"default\",\"source\":\"1e1781f7-56d6-40a0-91b8-fe92dc8c0054\",\"target\":\"fee10622-f22d-4bbc-b7b6-18a24412f117\",\"sourceHandle\":\"result\",\"targetHandle\":\"main\",\"animated\":false,\"className\":\"\"},{\"id\":\"fee10622-f22d-4bbc-b7b6-18a24412f117result-35c71bd5-bfbe-4b4b-a115-db04585fdeb7sourceb\",\"source\":\"fee10622-f22d-4bbc-b7b6-18a24412f117\",\"target\":\"35c71bd5-bfbe-4b4b-a115-db04585fdeb7\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"35c71bd5-bfbe-4b4b-a115-db04585fdeb7result-4834ca67-a677-466b-bb1b-0eee48125ac5main\",\"source\":\"35c71bd5-bfbe-4b4b-a115-db04585fdeb7\",\"target\":\"4834ca67-a677-466b-bb1b-0eee48125ac5\",\"sourceHandle\":\"result\",\"targetHandle\":\"main\",\"animated\":false,\"className\":\"\"},{\"id\":\"561d7f4e-657b-4a90-8533-e15f8dd32c19\",\"type\":\"default\",\"source\":\"4834ca67-a677-466b-bb1b-0eee48125ac5\",\"target\":\"3f0b7262-4368-4f45-9edb-f51594dd56a8\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"d1a00ec3-c578-46c3-98b1-810da0181244\",\"type\":\"default\",\"source\":\"0679a094-f974-4e7d-b010-13036bb72aca\",\"target\":\"5adb1ad5-3966-4a4f-8a96-2db1ff24d818\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"43a32e0c-e1bf-4454-9667-bf6ed02967ac\",\"type\":\"default\",\"source\":\"5adb1ad5-3966-4a4f-8a96-2db1ff24d818\",\"target\":\"fee10622-f22d-4bbc-b7b6-18a24412f117\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondary\",\"animated\":false,\"className\":\"\"},{\"id\":\"fdb1f7e3-9421-4bc3-b3ba-db476b55b8db\",\"type\":\"default\",\"source\":\"87916c97-d030-4b79-882e-be1f6609626d\",\"target\":\"21b7ac79-a1d1-4d02-8789-90c734c5aa63\",\"sourceHandle\":\"out\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"d1df181a-34e6-4685-b274-20ea28c9550b\",\"type\":\"default\",\"source\":\"21b7ac79-a1d1-4d02-8789-90c734c5aa63\",\"target\":\"4834ca67-a677-466b-bb1b-0eee48125ac5\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondary\",\"animated\":false,\"className\":\"\"},{\"id\":\"d8d98dff-b9ab-4866-b17d-4a01917f7b0a\",\"type\":\"default\",\"source\":\"21b7ac79-a1d1-4d02-8789-90c734c5aa63\",\"target\":\"a92bfe91-51ed-4e5d-ae17-0d17658787f1\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"c999013a-337b-42a2-ae66-abe13f4808fb\",\"type\":\"default\",\"source\":\"5adb1ad5-3966-4a4f-8a96-2db1ff24d818\",\"target\":\"35c71bd5-bfbe-4b4b-a115-db04585fdeb7\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcea\",\"animated\":false,\"className\":\"\"},{\"id\":\"8e83569f-666b-4cd1-bd9a-eef375036a7d\",\"type\":\"default\",\"source\":\"a92bfe91-51ed-4e5d-ae17-0d17658787f1\",\"target\":\"d4836f8b-54d9-4814-aa14-650017f0decf\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"907bdc67-2ece-46df-a3a5-433071c078c4\",\"type\":\"default\",\"source\":\"3f0b7262-4368-4f45-9edb-f51594dd56a8\",\"target\":\"d4836f8b-54d9-4814-aa14-650017f0decf\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourcea\",\"animated\":false,\"className\":\"\"},{\"id\":\"ce8174d0-abb0-48da-959a-c7514594724eout-b4aed1bb-518f-42cd-a53e-2a6609cdd30ftable\",\"source\":\"ce8174d0-abb0-48da-959a-c7514594724e\",\"target\":\"b4aed1bb-518f-42cd-a53e-2a6609cdd30f\",\"sourceHandle\":\"out\",\"targetHandle\":\"table\",\"animated\":false,\"className\":\"\"},{\"id\":\"5eb1e75b-805a-4bbe-81d2-4c6a99929f5f\",\"type\":\"default\",\"source\":\"d4836f8b-54d9-4814-aa14-650017f0decf\",\"target\":\"73b91498-ecaa-4b07-8e42-527a5ee93364\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"40f6660c-7cd4-41c0-8aec-cd68f55e349f\",\"type\":\"default\",\"source\":\"b4aed1bb-518f-42cd-a53e-2a6609cdd30f\",\"target\":\"73b91498-ecaa-4b07-8e42-527a5ee93364\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondary\",\"animated\":false,\"className\":\"\"},{\"id\":\"87cdf1a3-11ed-4931-8574-e407509cb62a\",\"type\":\"default\",\"source\":\"73b91498-ecaa-4b07-8e42-527a5ee93364\",\"target\":\"c67755a0-a52c-49e8-9586-4d3acaeba8a7\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"44f0af98-43a6-4946-8e67-7d2bc0d7d6bb\",\"type\":\"default\",\"source\":\"c67755a0-a52c-49e8-9586-4d3acaeba8a7\",\"target\":\"6133dab1-64b4-41fa-8a6e-263f89f3aa73\",\"sourceHandle\":\"result\",\"targetHandle\":\"sourceb\",\"animated\":false,\"className\":\"\"},{\"id\":\"6133dab1-64b4-41fa-8a6e-263f89f3aa73result-6cd17ccc-c65f-4a0f-b505-a62dc7b6bfe4source\",\"source\":\"6133dab1-64b4-41fa-8a6e-263f89f3aa73\",\"target\":\"6cd17ccc-c65f-4a0f-b505-a62dc7b6bfe4\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"420e13b2-6f23-47bb-b4a0-951abfbd50dc\",\"type\":\"default\",\"source\":\"6133dab1-64b4-41fa-8a6e-263f89f3aa73\",\"target\":\"8428cbb3-cc2e-405e-998b-9da0bcb9ee5c\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false,\"className\":\"\"},{\"id\":\"51060874-dcea-4f1c-aa20-12cb8bf05da3\",\"source\":\"c5c5016c-7135-4e90-8919-3b21ff5bcb96\",\"sourceHandle\":\"out\",\"target\":\"b4d114ca-9fb9-4f63-a3c3-e105c8ba4d7d\",\"targetHandle\":\"secondary\",\"type\":\"default\",\"className\":\"\",\"animated\":false},{\"id\":\"3c2d19b1-0dea-4ebb-ab06-eb732ee42644\",\"source\":\"6133dab1-64b4-41fa-8a6e-263f89f3aa73\",\"sourceHandle\":\"result\",\"target\":\"b4d114ca-9fb9-4f63-a3c3-e105c8ba4d7d\",\"targetHandle\":\"main\",\"type\":\"default\",\"className\":\"\",\"animated\":false},{\"id\":\"b4d114ca-9fb9-4f63-a3c3-e105c8ba4d7dresult-f3702a0d-239b-4c00-8c6e-23e6ae2d73aesourceb\",\"source\":\"b4d114ca-9fb9-4f63-a3c3-e105c8ba4d7d\",\"sourceHandle\":\"result\",\"target\":\"f3702a0d-239b-4c00-8c6e-23e6ae2d73ae\",\"targetHandle\":\"sourceb\",\"className\":\"\",\"animated\":false},{\"id\":\"47316f63-7a16-42ee-9324-0d78ab89371d\",\"source\":\"f3702a0d-239b-4c00-8c6e-23e6ae2d73ae\",\"sourceHandle\":\"result\",\"target\":\"b33612da-fe4f-4694-af8e-ecefe7d00608\",\"targetHandle\":\"source\",\"type\":\"default\",\"className\":\"\",\"animated\":false},{\"id\":\"0fd21dc6-a18e-40f7-af9c-8d16e4a72531\",\"source\":\"b33612da-fe4f-4694-af8e-ecefe7d00608\",\"sourceHandle\":\"result\",\"target\":\"49770e8b-c73e-44d3-8a7f-e80363efec6c\",\"targetHandle\":\"source\",\"type\":\"default\",\"className\":\"\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":110.61194267267615,\"y\":74.17441682791342,\"zoom\":0.45288851595723056},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":false}"}
  */
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_98ff7193f4b94032_result`
  AS
    select geom, wadmkc, wadmkd, wadmkk from `carto-dw-ac-ki5mm8fr.shared.data_kelurahan_neighborhood`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_8cfc077cb44c0ab5_result`
  AS
    WITH __h3 AS
    (
      SELECT
        s.wadmkc, s.wadmkd, s.wadmkk,
        `carto-un.carto`.H3_POLYFILL_MODE(
            geom,
            11,
            'intersects'
          ) h3s
      FROM
        (
          SELECT *
          FROM `WORKFLOW_03297008558afb3a_98ff7193f4b94032_result`
          WHERE geom IS NOT NULL
        ) s
    )
    SELECT * EXCEPT(h3s)
    FROM __h3, __h3.h3s AS h3;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_24c3cb489ad531e4_result`
  AS
    SELECT
      *,
      `carto-un.carto`.H3_CENTER(
        h3
      ) AS h3_geom
    FROM
      `WORKFLOW_03297008558afb3a_8cfc077cb44c0ab5_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_94ba0da7a64aa9dc_result`
  AS
    SELECT GENERATE_UUID() AS id, *
    FROM `carto-dw-ac-ki5mm8fr.shared.data_genangan_banjir_24`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_14fb858f3817f827_result`
  AS
    SELECT GENERATE_UUID() AS id, *
    FROM `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.IMPORTED_03297008558afb3a_Data_Pengungsian`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_33ef96f90eeb5849_result`
  AS
    SELECT *, 
      CONCAT(nama_lokasi, ', ', kelurahan, ', ', kecamatan, ', ', kota) AS name_pengungsian
    FROM `WORKFLOW_03297008558afb3a_14fb858f3817f827_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_5599d338d861286f_result`
  AS
    SELECT geom, flood_class
    FROM `carto-dw-ac-ki5mm8fr.shared.output_risk_kelurahan`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_aed32825dca42297_result`
  AS
    WITH nearest AS (
      SELECT a.h3 AS main_id,
          ARRAY_AGG(
              STRUCT(
                  b.id AS nearest_id,
                  ST_DISTANCE(
                      a.h3_geom,
                      b.geom
                  ) AS nearest_distance
              )
              ORDER BY ST_DISTANCE(
                      a.h3_geom,
                      b.geom
                  )
              LIMIT 1
          ) [ORDINAL(1)] AS nearest
      FROM `WORKFLOW_03297008558afb3a_24c3cb489ad531e4_result` a
          JOIN `WORKFLOW_03297008558afb3a_94ba0da7a64aa9dc_result` b
            ON ST_DWITHIN(
              a.h3_geom,
              b.geom,
              2500 
            )
      GROUP BY a.h3
    )
    SELECT a.*,
        n.nearest.nearest_id AS nearest_id,
        n.nearest.nearest_distance  AS nearest_distance
    FROM nearest n
        JOIN `WORKFLOW_03297008558afb3a_24c3cb489ad531e4_result` a
          ON a.h3 = n.main_id;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_f27d42b2d8874408_result`
  AS
    with formating as (select * except (nearest_id, nearest_distance), nearest_id as nearest_id_genangan, nearest_distance as nearest_distance_genangan from `WORKFLOW_03297008558afb3a_aed32825dca42297_result`)
    select b.*, a.tanggal_ke as genangan_tanggal, a.lokasi as genangan_lokasi, a.wilayah as genangan_wilayah, a.tinggi_gen as genangan_tinggi_meter, a.kategori_p as  genangan_kategori
    from formating b inner join `WORKFLOW_03297008558afb3a_94ba0da7a64aa9dc_result` a on b.nearest_id_genangan = a.id;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_fd8927d4dde7415e_result`
  AS
    WITH nearest AS (
      SELECT a.h3 AS main_id,
          ARRAY_AGG(
              STRUCT(
                  b.id AS nearest_id,
                  ST_DISTANCE(
                      a.h3_geom,
                      b.geom
                  ) AS nearest_distance
              )
              ORDER BY ST_DISTANCE(
                      a.h3_geom,
                      b.geom
                  )
              LIMIT 1
          ) [ORDINAL(1)] AS nearest
      FROM `WORKFLOW_03297008558afb3a_f27d42b2d8874408_result` a
          JOIN `WORKFLOW_03297008558afb3a_14fb858f3817f827_result` b
            ON ST_DWITHIN(
              a.h3_geom,
              b.geom,
              10000 
            )
      GROUP BY a.h3
    )
    SELECT a.*,
        n.nearest.nearest_id AS nearest_id,
        n.nearest.nearest_distance  AS nearest_distance
    FROM nearest n
        JOIN `WORKFLOW_03297008558afb3a_f27d42b2d8874408_result` a
          ON a.h3 = n.main_id;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_940432759b613b05_result`
  AS
    select * except (nearest_id, nearest_distance), nearest_id as nearest_id_pengungsian, nearest_distance as nearest_distance_pengungsian from `WORKFLOW_03297008558afb3a_fd8927d4dde7415e_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_287af9424a2fa1e9_result`
  AS
    select a.*, b.name_pengungsian from `WORKFLOW_03297008558afb3a_940432759b613b05_result` a 
    inner join `WORKFLOW_03297008558afb3a_33ef96f90eeb5849_result` b on a.nearest_id_pengungsian = b.id  ;
  END;
  BEGIN
  DECLARE alias STRING;
  CREATE TABLE `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.table_2ce2ee0b_8d33_41bf_8018_57d617d087a4` AS
  SELECT * FROM `WORKFLOW_03297008558afb3a_5599d338d861286f_result`
  WHERE 1=0;
  EXECUTE IMMEDIATE
  '''
    with __alias AS(
      SELECT CONCAT(
        'b.', column_name, ' AS ', column_name, '_secondary'
      ) col_alias
      FROM `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b`.INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'table_2ce2ee0b_8d33_41bf_8018_57d617d087a4'
    )
    SELECT STRING_AGG(col_alias, ', ')
    FROM __alias
  '''
  INTO alias;
  DROP TABLE `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.table_2ce2ee0b_8d33_41bf_8018_57d617d087a4`;
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_9f5611b9dffe85fd_result`
    AS
      SELECT
        ST_INTERSECTION(
          b.geom,
          a.h3_geom
        )
      AS intersection_h3_geom_geom,
        a.*, %s
      FROM `WORKFLOW_03297008558afb3a_287af9424a2fa1e9_result` AS a
      JOIN `WORKFLOW_03297008558afb3a_5599d338d861286f_result` AS b
      ON ST_INTERSECTS(
        b.geom,
        a.h3_geom
      )''',
    '%s',
    alias
  );
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_f9ed6ad1790b5d8e_result`
  AS
    SELECT * EXCEPT (geom_secondary)
    FROM `WORKFLOW_03297008558afb3a_9f5611b9dffe85fd_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_c4b5f8ead9f893e0_result`
  AS
    select * except(flood_class_secondary, intersection_h3_geom_geom), flood_class_secondary as flood_class from `WORKFLOW_03297008558afb3a_f9ed6ad1790b5d8e_result` ;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-ki5mm8fr.shared.output_risk_h3';
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
    CLONE `WORKFLOW_03297008558afb3a_c4b5f8ead9f893e0_result`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_8fea23ecf2f08d82_result`
    AS
      SELECT * FROM `####`''',
    '####',
    __destination
  );
  END;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_c053f9f59c23e0d7_result`
  AS
    SELECT
      SAFE_CAST(h3 AS STRING) AS h3,
      SAFE_CAST(wadmkd AS STRING) AS kelurahan,
      SAFE_CAST(wadmkc AS STRING) AS kecamatan,
      SAFE_CAST(wadmkk AS STRING) AS kota,
      SAFE_CAST(nearest_distance_genangan AS FLOAT64) AS genangan_distance_m,
      SAFE_CAST(genangan_tanggal AS DATE) AS genangan_tanggal,
      SAFE_CAST(genangan_lokasi AS STRING) AS genangan_lokasi,
      SAFE_CAST(genangan_wilayah AS STRING) AS genangan_wilayah,
      SAFE_CAST(genangan_tinggi_meter AS STRING) AS genangan_tinggi_meter,
      SAFE_CAST(genangan_kategori AS STRING) AS genangan_kategori,
      SAFE_CAST(nearest_distance_pengungsian AS FLOAT64) AS pengungsian_distance_m,
      SAFE_CAST(name_pengungsian AS STRING) AS pengungsian_name,
      SAFE_CAST(flood_class AS STRING) AS flood_class
    FROM `WORKFLOW_03297008558afb3a_c4b5f8ead9f893e0_result`;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_c32c14786e4058d5_result`
  AS
    WITH nearest AS (
      SELECT a.h3 AS main_id,
          ARRAY_AGG(
              STRUCT(
                  b.id_faskes AS nearest_id,
                  ST_DISTANCE(
                      a.h3_geom,
                      b.geom
                  ) AS nearest_distance
              )
              ORDER BY ST_DISTANCE(
                      a.h3_geom,
                      b.geom
                  )
              LIMIT 1
          ) [ORDINAL(1)] AS nearest
      FROM `WORKFLOW_03297008558afb3a_c4b5f8ead9f893e0_result` a
          JOIN `carto-dw-ac-ki5mm8fr.shared.output_faskes` b
            ON ST_DWITHIN(
              a.h3_geom,
              b.geom,
              10000 
            )
      GROUP BY a.h3
    )
    SELECT a.*,
        n.nearest.nearest_id AS nearest_id,
        n.nearest.nearest_distance  AS nearest_distance
    FROM nearest n
        JOIN `WORKFLOW_03297008558afb3a_c4b5f8ead9f893e0_result` a
          ON a.h3 = n.main_id;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_84f27ff388038bcb_result`
  AS
    with reformat as (select * except (nearest_id, nearest_distance), nearest_id as nearest_id_faskes, nearest_distance as nearest_distance_faskes from `WORKFLOW_03297008558afb3a_c32c14786e4058d5_result`)
    select a.*, b.faskes_name from reformat a
    left join `carto-dw-ac-ki5mm8fr.shared.output_faskes` b on a.nearest_id_faskes = b.id_faskes;
  END;
  BEGIN
  CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_a4d6acde00c16e56_result`
  AS
    SELECT
      SAFE_CAST(h3 AS STRING) AS h3,
      SAFE_CAST(wadmkd AS STRING) AS kelurahan,
      SAFE_CAST(wadmkc AS STRING) AS kecamatan,
      SAFE_CAST(wadmkk AS STRING) AS kota,
      SAFE_CAST(nearest_distance_genangan AS FLOAT64) AS genangan_distance_m,
      SAFE_CAST(genangan_tanggal AS DATE) AS genangan_tanggal,
      SAFE_CAST(genangan_lokasi AS STRING) AS genangan_lokasi,
      SAFE_CAST(genangan_wilayah AS STRING) AS genangan_wilayah,
      SAFE_CAST(genangan_tinggi_meter AS STRING) AS genangan_tinggi_meter,
      SAFE_CAST(genangan_kategori AS STRING) AS genangan_kategori,
      SAFE_CAST(nearest_distance_pengungsian AS FLOAT64) AS pengungsian_distance_m,
      SAFE_CAST(name_pengungsian AS STRING) AS pengungsian_name,
      SAFE_CAST(nearest_distance_faskes AS FLOAT64) AS faskes_distance_m,
      SAFE_CAST(faskes_name AS STRING) AS faskes_name,
      SAFE_CAST(flood_class AS STRING) AS flood_class
    FROM `WORKFLOW_03297008558afb3a_84f27ff388038bcb_result`;
  END;
  BEGIN
  DECLARE __destination STRING DEFAULT 'carto-dw-ac-ki5mm8fr.shared.output_risk_h3_format';
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
    CLONE `WORKFLOW_03297008558afb3a_a4d6acde00c16e56_result`''',
    '####',
    __destination
  );
  EXECUTE IMMEDIATE
  REPLACE(
    '''CREATE TEMPORARY TABLE `WORKFLOW_03297008558afb3a_58b7004d59dbcbe5_result`
    AS
      SELECT * FROM `####`''',
    '####',
    __destination
  );
  END;
  END;
END;