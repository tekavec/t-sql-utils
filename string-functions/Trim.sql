CREATE FUNCTION Trim(
    @input nvarchar(MAX),
	@stringToTrim nvarchar(200))

RETURNS nvarchar(MAX)

AS
BEGIN
	DECLARE @veryUnlikelyString varchar(10)
	
	SET @veryUnlikelyString = '##.<~£~#~~$£'

	RETURN REPLACE(REPLACE(LTRIM(RTRIM(REPLACE(REPLACE(@input, ' ', @veryUnlikelyString), @stringToTrim, ' '))), ' ', @stringToTrim), @veryUnlikelyString, ' ')
END

-- Test1: SELECT dbo.Trim('"abc def"', '"')
-- Should return 'abc def'-- 
-- Test2: SELECT dbo.Trim('"abc def" AND', 'AND')
-- Should return '"abc def"'

GO