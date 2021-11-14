CREATE PROCEDURE dbo.spGetDataSourceList  
@Type Varchar(10),  
@ScheduleType Varchar(10) = 'Daily'  
AS  
BEGIN  
	
	/**********************************************************************************
	THE BELOW LOGIC OF QUERY IS WRITTEN BASED ON  CURRENT PROJECT REQUIRMENT, 
	PARAMETER TYPES AND NUMBERS. THE QUERY CAN BE CHANGED BASED ON THE USER NEED.
	**********************************************************************************/
	SET NOCOUNT ON

	-- Lists the data source which returns JSON type data
	IF @Type = 'JSON'  
	BEGIN 
		-- in this sp only 2 params are used. If needed more can be added by changing in below query
		SELECT SourceName,SourceVal1 BaseURL,  
		SourceVal2+Param1Name+'='+Param1Val+'&'+Param2Name+'='+ Param2Val AS RelativeURL,AccessToken,  
		TargetLocation,TargetVal,APIHeader1,TargetFileExtension 
		FROM dbo.DataSourceConfigs  
		WHERE SourceType = 'JSON' AND ExtractType = @ScheduleType AND IsActive = 1  
	END 
	-- Lists the data source which returns XML type data
	ELSE IF @Type = 'XML'  
	BEGIN  
		SELECT SourceName,SourceVal1 BaseURL,  
		SourceVal2 AS RelativeURL,
		TargetLocation,TargetVal,TargetFileExtension
		FROM dbo.DataSourceConfigs  
		WHERE SourceType = 'XML' AND ExtractType = @ScheduleType AND IsActive = 1  
	END 
	-- Lists the data source of FTP type
	ELSE IF @Type = 'FTP'  
	BEGIN  
		SELECT SourceName, SourceVal1 SourceFolder,  
		SourceVal2 AS SourceSubFolder,  
		TargetLocation, TargetVal, TargetFileExtension
		FROM dbo.DataSourceConfigs  
		WHERE SourceType = 'FTP' AND ExtractType = @ScheduleType AND IsActive = 1  
	END
	-- Lists the data source of SQL type
	ELSE IF @Type = 'SQL'  
	BEGIN 
		-- The pre query is the query which need to be executed before the main query
		-- This is mandatory in my case as some queries need the data availbility to be checked before loading the data
		-- In case the pre validation not needed this query will retun a sql statement of SELECT Current Date value
		SELECT SourceName,REPLACE(SourceVal1,'<Param1Val>','''' + Param1Val + '''') PreQuery, SourceVal2 SQLQuery,  '''' + Param1Val + '''' Param1Val,
		TargetLocation,TargetVal, TargetFileExtension  
		FROM dbo.DataSourceConfigs  
		WHERE SourceType = 'SQL' AND ExtractType = @ScheduleType AND IsActive = 1  
	END
END