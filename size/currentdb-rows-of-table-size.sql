DECLARE @tableName nvarchar(200)
DECLARE @idColumnName nvarchar(200)
DECLARE @sql nvarchar(max)
DECLARE @topNRecords nvarchar(20)

SET @tableName = '<your table name>'
SET @idColumnName = '<your table PK column name>'
SET @topNRecords = '1000'

SET @sql = 'SELECT TOP ' + @topNRecords + ' ' + @idColumnName +' , (0'

SELECT @sql = @sql + ' + ISNULL(DATALENGTH(' + name + '), 1)' from sys.columns WHERE object_id = object_id(@tableName)

SET @sql = @sql + ') AS rowSize from ' + @tableName + ' ORDER BY rowSize DESC'

EXEC (@sql)


