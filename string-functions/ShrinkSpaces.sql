CREATE FUNCTION ShrinkSpaces(
    @input nvarchar(MAX))

RETURNS nvarchar(MAX)

AS
BEGIN

	DECLARE @veryUnlikelyString varchar(20)
	DECLARE @veryUnlikelyStringInverse varchar(20)

	SET @veryUnlikelyString = '##.<~£~#~~$£'
	SET @veryUnlikelyStringInverse = '£$~~#~£~<.##'

	RETURN REPLACE(REPLACE(REPLACE(@input,' ', @veryUnlikelyString + @veryUnlikelyStringInverse), + @veryUnlikelyStringInverse + @veryUnlikelyString,''), @veryUnlikelyString + @veryUnlikelyStringInverse,' ')

END

-- Test: SELECT dbo.ShrinkSpaces('abc     de  fgh i')
-- Should return 'abc de fgh i'

GO
