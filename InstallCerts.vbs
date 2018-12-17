'Run via below in a .bat file as admin
'cd %~dp0
'CScript InstallCerts.vbs
'pause

Dim StdIn, StdOut
Set StdIn = WScript.StdIn
Set StdOut = WScript.StdOut
StdOut.WriteLine "Please enter the address of your java directory"
str = StdIn.ReadLine

Call installCerts(str)

Function installCerts(ByVal address)
	Set objFSO = Createobject("Scripting.FileSystemObject")
	Set oFolder = objFSO.GetFolder(objFSO.GetParentFolderName(WScript.ScriptFullName))
	Set objShell = Wscript.CreateObject ("Wscript.shell")
	Call objShell.Run("cmd.exe")
	wsh.sleep 1000
	objShell.AppActivate "cmd.exe"
	wsh.sleep 1000
	
	For Each oFile in oFolder.Files
		If LCase(objFSO.GetExtensionName(oFile.Name)) = "cer" Or LCase(objFSO.GetExtensionName(oFile.Name)) = "crt" Then
			'Can't use %JAVA_HOME% as the % marks don't appear?
			Call objShell.SendKeys("""" & address & "\bin\keytool"" -keystore" & " """ & address & "\jre\lib\security\cacerts"" -importcert -alias " & oFile.Name & " -file " & oFile.Name & "{ENTER}")
			wsh.sleep 1000
			Call objShell.SendKeys("changeit{ENTER}")
			wsh.sleep 1000
			Call objShell.SendKeys("yes{ENTER}")
			wsh.sleep 1000
		End If
	Next
	Call objShell.SendKeys("pause{ENTER}")
End Function
