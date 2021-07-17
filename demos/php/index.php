<?php
//please in php.ini enable extension=php_com_dotnet.dll
  header('Content-type: text/html; charset=windows-1256');
  $af = new COM('ArFigures.Figure');
  $s = $af->Extended(154654, 'áíÑÉ', 'áíÑÊíä', 'áíÑÊÇä', 'áíÑÇÊ', true)
?>
<html>
<body>
<?php
  echo $s;
?>
</body>
</html>
