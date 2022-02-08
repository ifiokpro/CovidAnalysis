Select *
From CovidProject..deaths
Where continent is not null 
order by 1,2

-- This is the data we will be working with

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidProject..deaths
Where continent is not null 
order by 1,2

-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in Nigeria

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidProject..deaths
Where location like '%nigeria%'
and continent is not null
order by 1,2

-- Shows what percentage of population infected with Covid
Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From CovidProject..deaths
order by 1,2

-- Showing contintents with the highest death count per population in the descending order of Total Death Count

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From CovidProject..deaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidProject..deaths
Group by Location, Population
order by PercentPopulationInfected desc
