-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: carto-un.carto. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_10efec4584773c7e`(
    `address` STRING
)
BEGIN
  /*
   {"versionId":"942b327097bbdb34","paramsId":"4a1b27c1a0fda9fb","isImmutable":true,"diagramJson":"{\"title\":\"API - risk checking input alamat\",\"description\":\"\",\"nodes\":[{\"id\":\"3c47fb80-d769-44e7-8169-43e0003326fc\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"select @address as address\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":128,\"y\":208},\"selected\":false},{\"id\":\"485a1f09-5ef1-4b1e-ace2-2e2d053d1a68\",\"data\":{\"name\":\"native.geocode\",\"type\":\"generic\",\"label\":\"ST Geocode\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"address\",\"type\":\"Column\",\"title\":\"Column with addresses\",\"parent\":\"source\",\"placeholder\":\"address\",\"dataType\":[\"string\"],\"description\":\"Column with addresses\",\"value\":\"address\"},{\"name\":\"country\",\"type\":\"Selection\",\"title\":\"Country\",\"optional\":true,\"default\":null,\"options\":[\"Afghanistan\",\"land Islands\",\"Albania\",\"Algeria\",\"American Samoa\",\"Andorra\",\"Angola\",\"Anguilla\",\"Antarctica\",\"Antigua and Barbuda\",\"Argentina\",\"Armenia\",\"Aruba\",\"Australia\",\"Austria\",\"Azerbaijan\",\"Bahamas\",\"Bahrain\",\"Bangladesh\",\"Barbados\",\"Belarus\",\"Belgium\",\"Belize\",\"Benin\",\"Bermuda\",\"Bhutan\",\"Bolivia\",\"Bosnia and Herzegovina\",\"Botswana\",\"Bouvet Island\",\"Brazil\",\"British Indian Ocean Territory\",\"Brunei Darussalam\",\"Bulgaria\",\"Burkina Faso\",\"Burundi\",\"Cambodia\",\"Cameroon\",\"Canada\",\"Cape Verde\",\"Cayman Islands\",\"Central African Republic\",\"Chad\",\"Chile\",\"China\",\"Christmas Island\",\"Cocos (Keeling) Islands\",\"Colombia\",\"Comoros\",\"Congo\",\"Congo, The Democratic Republic of the\",\"Cook Islands\",\"Costa Rica\",\"Cote D\\\"Ivoire\",\"Croatia\",\"Cuba\",\"Cyprus\",\"Czech Republic\",\"Denmark\",\"Djibouti\",\"Dominica\",\"Dominican Republic\",\"Ecuador\",\"Egypt\",\"El Salvador\",\"Equatorial Guinea\",\"Eritrea\",\"Estonia\",\"Ethiopia\",\"Falkland Islands (Malvinas)\",\"Faroe Islands\",\"Fiji\",\"Finland\",\"France\",\"French Guiana\",\"French Polynesia\",\"French Southern Territories\",\"Gabon\",\"Gambia\",\"Georgia\",\"Germany\",\"Ghana\",\"Gibraltar\",\"Greece\",\"Greenland\",\"Grenada\",\"Guadeloupe\",\"Guam\",\"Guatemala\",\"Guernsey\",\"Guinea\",\"Guinea-Bissau\",\"Guyana\",\"Haiti\",\"Heard Island and Mcdonald Islands\",\"Holy See (Vatican City State)\",\"Honduras\",\"Hong Kong\",\"Hungary\",\"Iceland\",\"India\",\"Indonesia\",\"Iran, Islamic Republic Of\",\"Iraq\",\"Ireland\",\"Isle of Man\",\"Israel\",\"Italy\",\"Jamaica\",\"Japan\",\"Jersey\",\"Jordan\",\"Kazakhstan\",\"Kenya\",\"Kiribati\",\"Korea, Democratic People\\\"S Republic of\",\"Korea, Republic of\",\"Kuwait\",\"Kyrgyzstan\",\"Lao People\\\"S Democratic Republic\",\"Latvia\",\"Lebanon\",\"Lesotho\",\"Liberia\",\"Libyan Arab Jamahiriya\",\"Liechtenstein\",\"Lithuania\",\"Luxembourg\",\"Macao\",\"Macedonia, The Former Yugoslav Republic of\",\"Madagascar\",\"Malawi\",\"Malaysia\",\"Maldives\",\"Mali\",\"Malta\",\"Marshall Islands\",\"Martinique\",\"Mauritania\",\"Mauritius\",\"Mayotte\",\"Mexico\",\"Micronesia, Federated States of\",\"Moldova, Republic of\",\"Monaco\",\"Mongolia\",\"Montenegro\",\"Montserrat\",\"Morocco\",\"Mozambique\",\"Myanmar\",\"Namibia\",\"Nauru\",\"Nepal\",\"Netherlands\",\"Netherlands Antilles\",\"New Caledonia\",\"New Zealand\",\"Nicaragua\",\"Niger\",\"Nigeria\",\"Niue\",\"Norfolk Island\",\"Northern Mariana Islands\",\"Norway\",\"Oman\",\"Pakistan\",\"Palau\",\"Palestinian Territory, Occupied\",\"Panama\",\"Papua New Guinea\",\"Paraguay\",\"Peru\",\"Philippines\",\"Pitcairn\",\"Poland\",\"Portugal\",\"Puerto Rico\",\"Qatar\",\"Reunion\",\"Romania\",\"Russian Federation\",\"RWANDA\",\"Saint Helena\",\"Saint Kitts and Nevis\",\"Saint Lucia\",\"Saint Pierre and Miquelon\",\"Saint Vincent and the Grenadines\",\"Samoa\",\"San Marino\",\"Sao Tome and Principe\",\"Saudi Arabia\",\"Senegal\",\"Serbia\",\"Seychelles\",\"Sierra Leone\",\"Singapore\",\"Slovakia\",\"Slovenia\",\"Solomon Islands\",\"Somalia\",\"South Africa\",\"South Georgia and the South Sandwich Islands\",\"Spain\",\"Sri Lanka\",\"Sudan\",\"Suriname\",\"Svalbard and Jan Mayen\",\"Swaziland\",\"Sweden\",\"Switzerland\",\"Syrian Arab Republic\",\"Taiwan, Province of China\",\"Tajikistan\",\"Tanzania, United Republic of\",\"Thailand\",\"Timor-Leste\",\"Togo\",\"Tokelau\",\"Tonga\",\"Trinidad and Tobago\",\"Tunisia\",\"Turkey\",\"Turkmenistan\",\"Turks and Caicos Islands\",\"Tuvalu\",\"Uganda\",\"Ukraine\",\"United Arab Emirates\",\"United Kingdom\",\"United States\",\"United States Minor Outlying Islands\",\"Uruguay\",\"Uzbekistan\",\"Vanuatu\",\"Venezuela\",\"Viet Nam\",\"Virgin Islands, British\",\"Virgin Islands, U.S.\",\"Wallis and Futuna\",\"Western Sahara\",\"Yemen\",\"Zambia\",\"Zimbabwe\"],\"description\":\"Country\",\"value\":\"Indonesia\"},{\"name\":\"customoptions\",\"type\":\"String\",\"title\":\"Geocoding options\",\"default\":\"\",\"optional\":true,\"mode\":\"multiline\",\"allowExpressions\":false,\"description\":\"Geocoding options\",\"value\":\"\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":304,\"y\":208},\"selected\":false},{\"id\":\"c2dbb9a2-359d-41b3-8720-a0d87608829e\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"with get_h3 as (\\n  select `carto-un`.carto.H3_FROMGEOGPOINT(geom, 11) as h3 from `$b` \\n)\\n\\nselect a.* from `carto-dw-ac-ki5mm8fr.shared.output_risk_h3_format` a, get_h3 b where a.h3 = b.h3\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":496,\"y\":208},\"selected\":false},{\"id\":\"7df0318a-dd48-4588-badf-63e4aa123c25\",\"data\":{\"name\":\"native.output\",\"type\":\"generic\",\"label\":\"API Output\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"mode\",\"type\":\"Selection\",\"mode\":\"radio\",\"title\":\"Execution method\",\"helper\":\"This setting controls the type of return value of the API call. Sync returns the result immediately, while Async returns a job ID.\",\"options\":[{\"icon\":\"sync\",\"name\":\"Sync\",\"value\":\"sync\",\"description\":\"Returns the result data directly in the API response.\"},{\"icon\":\"async\",\"name\":\"Async\",\"value\":\"async\",\"description\":\"Returns a job ID and table reference where the result will be available once completed.\"}],\"value\":\"sync\",\"default\":\"async\",\"allowExpressions\":false,\"providers\":[\"snowflake\",\"bigquery\"],\"description\":\"Execution method\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":672,\"y\":208},\"selected\":false}],\"edges\":[{\"id\":\"3c47fb80-d769-44e7-8169-43e0003326fcresult-485a1f09-5ef1-4b1e-ace2-2e2d053d1a68source\",\"source\":\"3c47fb80-d769-44e7-8169-43e0003326fc\",\"target\":\"485a1f09-5ef1-4b1e-ace2-2e2d053d1a68\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"46d52b4d-1fe3-4097-b307-13451b07f6f3\",\"type\":\"default\",\"source\":\"485a1f09-5ef1-4b1e-ace2-2e2d053d1a68\",\"target\":\"c2dbb9a2-359d-41b3-8720-a0d87608829e\",\"sourceHandle\":\"match\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"c2dbb9a2-359d-41b3-8720-a0d87608829eresult-7df0318a-dd48-4588-badf-63e4aa123c25source\",\"source\":\"c2dbb9a2-359d-41b3-8720-a0d87608829e\",\"target\":\"7df0318a-dd48-4588-badf-63e4aa123c25\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false}],\"variables\":[{\"name\":\"address\",\"type\":\"String\",\"order\":1,\"value\":\"Jl Mampang Prapatan 11 Jakarta Selatan\",\"scopes\":[\"api\"]}],\"procedure\":{\"call\":\"CALL `carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_10efec4584773c7e`(@address)\",\"params\":\"{\\\"address\\\":\\\"Jl Mampang Prapatan 11 Jakarta Selatan\\\"}\",\"status\":\"exists\",\"updatedAt\":1755679603726},\"schedule\":{},\"viewport\":{\"x\":162.7274342040385,\"y\":-43.762929476718796,\"zoom\":1.961137292831775},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"bigquery\",\"useCache\":true}"}
  */
  DECLARE __outputtable STRING;
  DECLARE __outputtablefqn STRING;
  SET `address` = COALESCE(`address`, 'Jl Mampang Prapatan 11 Jakarta Selatan');
  SET __outputtable = 'wfproc_api_10efec4584773c7e_out_' || SUBSTRING(TO_HEX(MD5(ARRAY_TO_STRING([CAST(`address` AS STRING)], ','))), 1, 16);
  SET __outputtablefqn = 'carto-dw-ac-ki5mm8fr.workflows_temp_gandes_hackjkt_968c080b.wfproc_api_10efec4584773c7e_out_' || SUBSTRING(TO_HEX(MD5(ARRAY_TO_STRING([CAST(`address` AS STRING)], ','))), 1, 16);
  BEGIN
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_10efec4584773c7e_576abd3b2ab75959_result`
    AS
      select `address` as address;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_10efec4584773c7e_577c3a27885ea822_tempgeocoding`
    AS
      SELECT * FROM  `WORKFLOW_10efec4584773c7e_576abd3b2ab75959_result`;
    CALL `carto-un.carto`.GEOCODE_TABLE(
      'https://gcp-us-east1.api.carto.com',
      'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfa2k1bW04ZnIiLCJqdGkiOiJhZWFhZmM4OCJ9.hP9meFvPqh1lIBD2ee2pWvj3tMOHRWkVZyjwQRBrEz8',
      'WORKFLOW_10efec4584773c7e_577c3a27885ea822_tempgeocoding',
      'address',
      'geom',
      'ID',
      NULL);
    CREATE TEMPORARY TABLE `WORKFLOW_10efec4584773c7e_577c3a27885ea822_match`
    AS
      SELECT * FROM  `WORKFLOW_10efec4584773c7e_577c3a27885ea822_tempgeocoding` WHERE geom IS NOT NULL;
    CREATE TEMPORARY TABLE `WORKFLOW_10efec4584773c7e_577c3a27885ea822_unmatch`
    AS
      SELECT * FROM  `WORKFLOW_10efec4584773c7e_577c3a27885ea822_tempgeocoding` WHERE geom IS NULL;
    END;
    BEGIN
    CREATE TEMPORARY TABLE `WORKFLOW_10efec4584773c7e_618f142e01545114_result`
    AS
      with get_h3 as (
        select `carto-un`.carto.H3_FROMGEOGPOINT(geom, 11) as h3 from `WORKFLOW_10efec4584773c7e_577c3a27885ea822_match` 
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
        SELECT * FROM WORKFLOW_10efec4584773c7e_618f142e01545114_result''',
      '##TABLENAME##',
      __outputtablefqn
    );
  END;
  EXECUTE IMMEDIATE
  REPLACE (
  '''SELECT * FROM `##TABLENAME##`''',
  '##TABLENAME##',
  __outputtablefqn
  );
END;