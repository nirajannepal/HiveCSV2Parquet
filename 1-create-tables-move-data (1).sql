create external table ontime (
  Year INT,
  Month INT,
  DayofMonth INT,
  DayOfWeek INT,
  DepTime  INT,
  CRSDepTime INT,
  ArrTime INT,
  CRSArrTime INT,
  UniqueCarrier STRING,
  FlightNum INT,
  TailNum STRING,
  ActualElapsedTime INT,
  CRSElapsedTime INT,
  AirTime INT,
  ArrDelay INT,
  DepDelay INT,
  Origin STRING,
  Dest STRING,
  Distance INT,
  TaxiIn INT,
  TaxiOut INT,
  Cancelled INT,
  CancellationCode STRING,
  Diverted STRING,
  CarrierDelay INT,
  WeatherDelay INT,
  NASDelay INT,
  SecurityDelay INT,
  LateAircraftDelay INT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
LOCATION 's3://jack-hurley-talend-bucket/nirajan/hive/';



create external table ontime_parquet_snappy (
  Year INT,
  Month INT,
  DayofMonth INT,
  DayOfWeek INT,
  DepTime  INT,
  CRSDepTime INT,
  ArrTime INT,
  CRSArrTime INT,
  UniqueCarrier STRING,
  FlightNum INT,
  TailNum STRING,
  ActualElapsedTime INT,
  CRSElapsedTime INT,
  AirTime INT,
  ArrDelay INT,
  DepDelay INT,
  Origin STRING,
  Dest STRING,
  Distance INT,
  TaxiIn INT,
  TaxiOut INT,
  Cancelled INT,
  CancellationCode STRING,
  Diverted STRING,
  CarrierDelay INT,
  WeatherDelay INT,
  NASDelay INT,
  SecurityDelay INT,
  LateAircraftDelay INT
) STORED AS PARQUET LOCATION 's3://jack-hurley-talend-bucket/nirajan/hive/airline-parquet-snappy/' TBLPROPERTIES ("orc.compress"="SNAPPY");
 
INSERT OVERWRITE TABLE ontime_parquet_snappy SELECT * FROM ontime;