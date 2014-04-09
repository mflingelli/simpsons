Option Explicit

Dim objFSO, objINDFile, objINDFileNew
Dim strZeile, strDateiNeu, strItem
Dim regEx
Dim match, matches

Set regEx = New RegExp
'{\bf *}
regEx.Pattern = "\x7B\x5C\x62\x66(.+)\x7D"
regEx.IgnoreCase = True
regEx.Global = True

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objINDFile    = objFSO.OpenTextFile("Simpsons.ind")
Set objINDFileNew = objFSO.CreateTextFile("Simpsons.ind.new")

Do While not objINDFile.AtEndOfStream
  strZeile = objINDFile.ReadLine
  Set matches = regEx.Execute(strZeile)
  if matches.Count > 0 then
    for each match in matches
      strItem = Trim(match.value)
      strItem = Mid(strItem, 6, Len(strItem) - 6)
    next
    strZeile = "\pdfbookmark[1]{" & strItem & "}{" & strItem &"}" & _
               "{\bf " & strItem & "}\nopagebreak"
  end if
  objINDFileNew.WriteLine(strZeile)
Loop

objINDFile.Close
objINDFileNew.Close