Set objFSO = Createobject("Scripting.FileSystemObject")
Set oFolder = objFSO.GetFolder(objFSO.GetParentFolderName(WScript.ScriptFullName))
Set objShell = Wscript.CreateObject ("Wscript.shell")
Call objShell.Run("cmd.exe")
wsh.sleep 1000
objShell.AppActivate "cmd.exe"
wsh.sleep 1000

For Each oFile in oFolder.Files
	If LCase(objFSO.GetExtensionName(oFile.Name)) = "cer" Or LCase(objFSO.GetExtensionName(oFile.Name)) = "crt" Then
		'objShell.SendKeys("""%JAVA_HOME%\bin\keytool"" -keystore ""%JAVA_HOME%\jre\lib\security\cacerts"" -importcert -alias appls.global.paas.gsnetcloud.corp -file appls.global.paas.gsnetcloud.corp.crt{ENTER}")
 		objShell.SendKeys("""C:\Program Files\Java\jdk1.8.0_191\bin\keytool"" -keystore ""C:\Program Files\Java\jdk1.8.0_191\jre\lib\security\cacerts"" -importcert -alias appls.global.paas.gsnetcloud.corp -file appls.global.paas.gsnetcloud.corp.crt{ENTER}")
		Call objShell.SendKeys("changeit{ENTER}")
		Call objShell.SendKeys("changeit{ENTER}")
		Call objShell.SendKeys("yes{ENTER}")		
	End If
	Call objShell.SendKeys("pause{ENTER}")
Next

