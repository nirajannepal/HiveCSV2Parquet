create external table ontimeStaging (
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
) STORED AS PARQUET 
LOCATION 's3://jack-hurley-talend-bucket/nirajan/hive/airline-parquet-snappy/' 
tblproperties ("parquet.compress"="SNAPPY");

create table ontime
with (
    external_LOCATION = 's3://jack-hurley-talend-bucket/nirajan/hive/airline-parquet-snappy/',
    format = 'parquet',
    parquet_compression = 'snappy',
    partition_by = array['ontime_year',
                         'ontime_month'
    ]
    
    
)as select Year,
  Month ,
  DayofMonth ,
  DayOfWeek ,
  DepTime  ,
  year as ontime_year,
  Month as ontime_month

from ontimeStaging



