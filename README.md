**INDEPTH Core Microdata to OMOP CDM Conversion (INSPIRE Project)**

This repository provides tools, guidelines, and resources for mapping INDEPTH Core Microdata to the **OMOP CDM 5.4** structure as part of the INSPIRE Project. By integrating demographic surveillance data with clinical data in a standardized format, this effort aims to enhance data harmonization, interoperability, and population health research.

This repository was used for writing the paper:
**INSPIRE datahub: a pan-African integrated suite of services for harmonising longitudinal population health data using OHDSI tools**
(January 2024, Frontiers in Digital Health 6:3, DOI:10.3389/fdgth.2024.1329630)

**Introduction**
The INDEPTH Core Microdata contains rich demographic surveillance information that requires transformation into the OMOP CDM format for compatibility with analytical tools such as **ATLAS** and integration with global health data platforms. This project focuses on enabling standardized data analysis for population health researchers.

**Project Goals**

1) Map INDEPTH Core Microdata to OMOP CDM v5.4 using Rabbit-in-a-Hat, WhiteRabbit, and Usagi.
2) Implement Extract, Transform, Load (ETL) processes using Pentaho Data Integration (PDI) for efficient data transformation.
3) Ensure data consistency, accuracy, and traceability throughout the transformation process.
4) Provide comprehensive documentation for users to understand the mapping logic and processes.

**Prerequisites**

1) Pentaho Data Integration (PDI)
2) Rabbit-in-a-Hat, WhiteRabbit, and Usagi (part of the OHDSI toolset)
3) Database system compatible with OMOP CDM (This project used the PostgreSQL)

**Installation**

1) Install OHDSI Tools - Rabbit-in-a-Hat, WhiteRabbit, and Usagi (https://www.ohdsi.org/software-tools/)
2) Install PostgreSQL database (https://www.postgresql.org/download/)
3) Download Pentaho Data Integration Community Edition and configure following official documentation. (https://hitachiedge1.jfrog.io/ui/native/pntpub-maven-release-cache/org/pentaho/di/pdi-ce/9.4.0.0-343/pdi-ce-9.4.0.0-343.zip)

**Usage Instruction**

1) Data Preparation: Ensure your INDEPTH Core Microdata is structured according to the provided schema.
2) Mapping Creation: Use Rabbit-in-a-Hat to define mappings for each data element.
3) ETL Execution with Pentaho:
  Open Pentaho Data Integration (Spoon).
  Execute the appropriate transformation jobs to convert INDEPTH Core Microdata to OMOP CDM.
4) SQL-based data Transformation is provided in the ETL SQL folder.

**Mapping Strategy**
The mapping follows a detailed field-by-field approach aligned with OMOP CDM 5.4 standards. Key strategies include:
1) Mapping individual, household, and location data to the PERSON, LOCATION, and CARE_SITE tables.
2) Linking demographic events, migrations, and vital statistics to the OBSERVATION, CONDITION_OCCURRENCE, and VISIT_OCCURRENCE tables.
3) Aligning vaccination, treatment, and clinical encounters to DRUG_EXPOSURE and MEASUREMENT tables.
