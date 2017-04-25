CREATE FUNCTION SplitStringExceptDoubleQuoted(
    @input nvarchar(MAX),
	@delimiter nvarchar(10))

RETURNS @parts TABLE (part nvarchar(MAX))

AS
BEGIN

DECLARE @len int = LEN(@input)
DECLARE @pos int = 1;
DECLARE @start int = 1;
DECLARE @ignore bit = 0;
	WHILE(@pos<=@len)
		BEGIN

			DECLARE @ch nchar(1) = SUBSTRING(@input, @pos, 1)

			IF ( @ch = '"' or @ch = '''')
			BEGIN
				SET @ignore = 1 - @ignore
			END

			IF (@ch = @delimiter AND @ignore = 0)
			BEGIN
				INSERT @parts VALUES (SUBSTRING(@input, @start, @pos-@start))
				SET @start = @pos+1
			END

			SET @pos = @pos + 1
		END

	IF (@start<>@pos)
		BEGIN
			INSERT @parts VALUES (SUBSTRING(@input, @start, @pos-@start))
		END

RETURN
END

-- Test: SELECT * FROM dbo.SplitStringExceptDoubleQuoted('"abc def" gh1 gh2 gh3 "ij kl" oprst -uvz "xxl"', ' ')
-- Should return the following table:
/*

"abc def"
gh1
gh2
gh3
"ij kl"
oprst
-uvz
"xxl"

*/

GO