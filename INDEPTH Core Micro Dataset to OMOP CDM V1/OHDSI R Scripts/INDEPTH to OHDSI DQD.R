
install.packages("remotes")
remotes::install_github("OHDSI/DataQualityDashboard")

Sys.getenv('R_USER')
library(usethis)
library(devtools)
library(SqlRender)
library(DatabaseConnector)
library(Achilles)


connectionDbDetails <- createConnectionDetails(dbms = "postgresql",
                                               server = "127.0.0.1/ohdsi",
                                               user ="ohdsi_admin_user",
                                               password = "pass123",
                                               pathToDriver = "//var//lib//postgresql//psqlJDBC")

cdmDatabaseSchema <- "cdm_indepth_omop_v1_0"
resultsDatabaseSchema <- "results_indepth_v1_0"
cdmSourceName <- "cdm_indepth_omop_v1_0"
cdmVersion <- "5.4"
numThreads <- 1
sqlOnly <- FALSE
sqlOnlyIncrementalInsert <- FALSE
sqlOnlyUnionCount <- 1
outputFolder <- "/media/tathagata/SSD/INSPIRE/Paper/INSPIR DataHub/OHDSI Scripts/results"
outputFile <- "results.json"
verboseMode <- TRUE
writeToTable <- TRUE
writeTableName <- "dqdashboard_results"
writeToCsv <- FALSE
csvFile <- ""
checkLevels <- c("TABLE", "FIELD", "CONCEPT")
checkNames <- c()
tablesToExclude <- c("CONCEPT", "VOCABULARY", "CONCEPT_ANCESTOR", "CONCEPT_RELATIONSHIP", "CONCEPT_CLASS", "CONCEPT_SYNONYM", "RELATIONSHIP", "DOMAIN")

DataQualityDashboard::executeDqChecks(connectionDetails = connectionDetails, 
                                      cdmDatabaseSchema = cdmDatabaseSchema, 
                                      resultsDatabaseSchema = resultsDatabaseSchema,
                                      cdmSourceName = cdmSourceName, 
                                      numThreads = numThreads,
                                      sqlOnly = sqlOnly, 
                                      sqlOnlyUnionCount = sqlOnlyUnionCount,
                                      sqlOnlyIncrementalInsert = sqlOnlyIncrementalInsert,
                                      outputFolder = outputFolder,
                                      verboseMode = verboseMode,
                                      writeToTable = writeToTable,
                                      writeToCsv = writeToCsv,
                                      csvFile = csvFile,
                                      checkLevels = checkLevels,
                                      tablesToExclude = tablesToExclude,
                                      checkNames = checkNames)


DataQualityDashboard::viewDqDashboard('/media/tathagata/SSD/INSPIRE/Paper/INSPIR DataHub/OHDSI Scripts/results/indepth_omop_cdm_v1_0-20231016193506.json')

checks <- DataQualityDashboard::listDqChecks(cdmVersion = "5.4")

