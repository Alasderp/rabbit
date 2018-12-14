Set objFSO = Createobject("Scripting.FileSystemObject")
Set oFolder = objFSO.GetFolder(objFSO.GetParentFolderName(WScript.ScriptFullName))
Set objShell = Wscript.CreateObject ("Wscript.shell")
Call objShell.Run("cmd.exe")
wsh.sleep 1000
objShell.AppActivate "cmd.exe"
wsh.sleep 1000
Call objShell.SendKeys("echo Testing 123{ENTER}")
Call objShell.SendKeys("pause{ENTER}")


For Each oFile in oFolder.Files
	If LCase(objFSO.GetExtensionName(oFile.Name)) = "cer" Or LCase(objFSO.GetExtensionName(oFile.Name)) = "crt" Then
    End If
Next
