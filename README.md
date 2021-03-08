# Set up  

First, clone the repository: 

`git clone https://github.com/canovasjm/InterviewProject_JuanCanovas.git`

I recommend to recreate the environment from the `environment.yml` file. If you are using [Anaconda](https://www.anaconda.com/products/individual) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) type:

`conda env create -n rga --file environment.yml`

To activate the environment type:

`conda activate rga`

# What you will find here

:open_file_folder: `backup`

A backup for the SQL Server data base created in task2. This comes in handy in case you need to restore the data base.

:open_file_folder: `datasources`

Data sources for the project as provided in the initial `zip` file.

:open_file_folder: `docker`

Some commands to set up SQL Server 2019 in a docker container, create and backup the data base.

:open_file_folder: `sql-helpers`

Messy list of queries used for debugging and testing. Use with caution since some queries delete the data base and/or its tables.

:open_file_folder: `task1`  

Python script to query [fixer.io](https://fixer.io/) API and convert salary currencies to USD. You will need an API key; get yours [here](https://fixer.io/product). To run the script with your key do one of the following:

* set an environment variable called `API_KEY_FIXER`    
* comment line #34 and hardcode the key in line #35  

:open_file_folder: `task2`  

Create the data base from scratch by running the scripts **in order**. SQL scripts create/alter tables and relationships, while python scripts upload the data to the tables once they are created.

:open_file_folder: `task3`  

Power BI dashboard.

:open_file_folder: `task4`  

Written report with findings/recommendations.

:open_file_folder: `tests`  

Unit tests for helper methods defined in task1.  

# Miscellaneous  

I tried to stick as much as possible to this [SQL Server naming convention](https://github.com/ktaranov/sqlserver-kit/blob/master/SQL%20Server%20Name%20Convention%20and%20T-SQL%20Programming%20Style.md).
