#region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=Geno.logo.ico
#PRE_Outfile=Genotools-C8812.exe
#PRE_UseUpx=n
#PRE_UseX64=n
#PRE_Res_Comment=格诺小工具程序
#PRE_Res_Description=华为U8818/C8818手机专用的小工具
#PRE_Res_LegalCopyright=格诺 Genokolar@gmail.com
#PRE_Res_requestedExecutionLevel=None
#endregion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
GUICreate("格诺工具箱 安智论坛", 300, 520)
GUISetFont(12)
dircreate(@TempDir & "\geno")
FileInstall("AdbWinApi.dll", @TempDir & "\geno\AdbWinApi.dll")
FileInstall("AdbWinUsbApi.dll", @TempDir & "\geno\AdbWinUsbApi.dll")
FileInstall("bootimg.exe", @TempDir & "\geno\bootimg.exe")
FileInstall("load_oemlogo", @TempDir & "\geno\load_oemlogo")
FileInstall("hwadb.exe", @TempDir & "\geno\hwadb.exe")
FileInstall("7z.exe", @TempDir & "\geno\7z.exe")
FileInstall("su", @TempDir & "\geno\su")
FileInstall("root.sh", @TempDir & "\geno\root.sh")
FileInstall("Superuser.apk", @TempDir & "\geno\Superuser.apk")
FileInstall("mempodroid", @TempDir & "\geno\mempodroid")
FileInstall("geno.jpg", @TempDir & "\geno\geno.jpg")
FileInstall("flash_image", @TempDir & "\geno\flash_image")
FileInstall("busybox", @TempDir & "\geno\busybox")
Opt("TrayIconHide", 1)
;配置参数,recovery分区及root的offset值
$offset = "0xd524 0xab8f"  
$RECP = "/dev/block/mmcblk0p16"


$isrooted = "root"
$islink = "unlink"

$MenuItem1 = GUICtrlCreateMenu("帮助")
$MenuItem2 = GUICtrlCreateMenuItem("使用说明", $MenuItem1)
GUICtrlSetOnEvent(-1, "help")
$MenuItem3 = GUICtrlCreateMenuItem("关于", $MenuItem1)


GUICtrlCreatePic(@TempDir & "\geno\geno.jpg", 0, 0, 300, 59)
GUICtrlSetTip(-1, "欢迎访问安智论坛获得更多资源和信息，你的支持是我的动力--安智网，格诺制作！")
$TEXT = GUICtrlCreateLabel("此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，请先将手机ROOT后再执行其他操作。点击更多信息按钮获取更多C8812及U8818的信息", 10, 68, 280, 80)
GUICtrlSetTip(-1, "安智网-格诺 genokolar 制作分享")
$root = GUICtrlCreateButton("ROOT手机", 80, 150, 140, 36)
GUICtrlSetTip(-1, "通过ADB连接ROOT你的手机！")
$unroot = GUICtrlCreateButton("UNROOT手机", 80, 150, 140, 36)
GUICtrlSetTip(-1, "通过ADB连接UNROOT你的手机！")
$recovery = GUICtrlCreateButton("刷入recovery", 80, 200, 140, 36)
GUICtrlSetTip(-1, "选择一个recovery镜像文件，本工具将自动为你更新recovery！")
$logo = GUICtrlCreateButton("更换第一屏", 80, 250, 140, 36)
GUICtrlSetTip(-1, "选择一张480*800的JPG图片，本工具将自动为你更换开机第一屏LOGO！")
$lite = GUICtrlCreateButton("精简系统", 80, 300, 140, 36)
GUICtrlSetTip(-1, "选择一个精简列表，本工具将自动为你精简你的系统！")
$patch = GUICtrlCreateButton("安装补丁", 80, 350, 140, 36)
GUICtrlSetTip(-1, "选择一个补丁文件，本工具将自动为你打上补丁！适合所有手机，需要ROOT权限。")
$help = GUICtrlCreateButton("更多信息", 80, 400, 140, 36)
GUICtrlSetTip(-1, "获取更多C8812及U8818等华为手机的资源和信息！")
$Cancel = GUICtrlCreateButton("退出程序", 80, 450, 140, 36)
GUICtrlSetTip(-1, "退出本工具！")
;Opt("GUIOnEventMode", 1)
;GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")
;GUICtrlSetOnEvent($Cancel, "_Exit")
#testlink()
testsu()
GUISetState()
While 1; 运行脚本直到窗口被关闭
	$msg = GUIGetMsg()
	Select
		Case $msg = $root
			rootphone()
			GUICtrlSetData($TEXT, "此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，更多信息点击更多信息按钮获取更多C8812及U8818的信息")
		Case $msg = $unroot
			unrootphone()
			GUICtrlSetData($TEXT, "此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，更多信息点击更多信息按钮获取更多C8812及U8818的信息")
		Case $msg = $logo
			changelogo()
			GUICtrlSetData($TEXT, "此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，更多信息点击更多信息按钮获取更多C8812及U8818的信息")
		Case $msg = $recovery
			changerecovery()
			GUICtrlSetData($TEXT, "此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，更多信息点击更多信息按钮获取更多C8812及U8818的信息")
		Case $msg = $lite
			litesystem()
			GUICtrlSetData($TEXT, "此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，更多信息点击更多信息按钮获取更多C8812及U8818的信息")
		Case $msg = $patch
			INSTALLZIP()
			GUICtrlSetData($TEXT, "此程序仅能用于华为C8812和U8818的手机，不可用于其他手机，更多信息点击更多信息按钮获取更多C8812及U8818的信息")
		Case $msg = $help
			_RunDOS("start Http://weibo.com/geno")
			_RunDOS("start http://www.iamgeno.com")

		Case $msg = $Cancel
			DELINSTALL()
			_Exit()
		Case $msg = $GUI_EVENT_CLOSE
			DELINSTALL()
			ExitLoop

	EndSelect
WEnd

Func testlink()
	FileDelete(@TempDir & "\geno\sh")
	Local $adb = @TempDir & "\geno\hwadb"
	If ProcessExists("adb.exe") Then $adb = "adb"
	_RunDOS($adb & " pull /system/bin/sh " & @TempDir & "\geno\sh")
	_RunDOS($adb & " pull /system/bin/mksh " & @TempDir & "\geno\sh")
	If FileExists(@TempDir & "\geno\sh") Then
		$islink = "link"
		testsu()
	Else
		MsgBox(4096, "连接失败", "检测到无法正确连接到你的手机，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后，再重试…", 0)
		$islink = "unlink"
	EndIf
EndFunc   ;==>testlink

Func testlink2()
	FileDelete(@TempDir & "\geno\sh")
	Local $adb = @TempDir & "\geno\hwadb"
	If ProcessExists("adb.exe") Then $adb = "adb"
	_RunDOS($adb & " pull /system/bin/sh " & @TempDir & "\geno\sh")
	_RunDOS($adb & " pull /system/bin/mksh " & @TempDir & "\geno\sh")
	If FileExists(@TempDir & "\geno\sh") Then
		$islink = "link"
		testsu2()
	Else
		MsgBox(4096, "连接失败", "检测到无法正确连接到你的手机，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后，再重试…", 0)
		$islink = "unlink"
	EndIf
EndFunc   ;==>testlink2

Func testsu()
	FileDelete(@TempDir & "\geno\subin")
	Local $adb = @TempDir & "\geno\hwadb"
	If ProcessExists("adb.exe") Then $adb = "adb"
	_RunDOS($adb & " pull /system/bin/su " & @TempDir & "\geno\subin")
	_RunDOS($adb & " pull /system/xbin/su " & @TempDir & "\geno\subin")
	If FileExists(@TempDir & "\geno\subin") Then
		GUICtrlSetState($root, $GUI_HIDE)
		GUICtrlSetState($unroot, $GUI_SHOW)
		$isrooted = "root"
	Else
		GUICtrlSetState($unroot, $GUI_HIDE)
		GUICtrlSetState($root, $GUI_SHOW)
		$isrooted = "unroot"
	EndIf
EndFunc   ;==>testsu

Func testsu2()
	FileDelete(@TempDir & "\geno\subin")
	Local $adb = @TempDir & "\geno\hwadb"
	If ProcessExists("adb.exe") Then $adb = "adb"
	_RunDOS($adb & " pull /system/bin/su " & @TempDir & "\geno\subin")
	_RunDOS($adb & " pull /system/xbin/su " & @TempDir & "\geno\subin")
	If FileExists(@TempDir & "\geno\subin") Then
		GUICtrlSetState($root, $GUI_HIDE)
		GUICtrlSetState($unroot, $GUI_SHOW)
		$isrooted = "root"
	Else
		GUICtrlSetState($unroot, $GUI_HIDE)
		GUICtrlSetState($root, $GUI_SHOW)
		MsgBox(4096, "手机没有ROOT", "你的手机没有ROOT，将不可正确执行此操作,请先ROOT手机，如果通用ROOT方法不可ROOT，你可以点击更多信息按钮访问作者博客获取ROOT的帮助！…", 0)
		$isrooted = "unroot"
	EndIf
EndFunc   ;==>testsu2

Func sumessage()
	FileDelete(@TempDir & "\geno\subin")
	Local $adb = @TempDir & "\geno\hwadb"
	If ProcessExists("adb.exe") Then $adb = "adb"
	_RunDOS($adb & " pull /system/bin/su " & @TempDir & "\geno\subin")
	_RunDOS($adb & " pull /system/xbin/su " & @TempDir & "\geno\subin")
	If FileExists(@TempDir & "\geno\subin") Then
		GUICtrlSetState($root, $GUI_HIDE)
		GUICtrlSetState($unroot, $GUI_SHOW)
		MsgBox(4096, "提示", "你的手机处于ROOT状态…", 0)
	Else
		GUICtrlSetState($unroot, $GUI_HIDE)
		GUICtrlSetState($root, $GUI_SHOW)
		MsgBox(4096, "提示", "你的手机处于未ROOT状态…", 0)
	EndIf
EndFunc   ;==>sumessage

Func rootphone()
	testlink()
	If $islink == "link" Then
		Local $adb = @TempDir & "\geno\hwadb"
		If ProcessExists("adb.exe") Then $adb = "adb"
		GUICtrlSetData($TEXT, "复制所需文件到手机...")
		_RunDOS($adb & " push " & @TempDir & "\geno\mempodroid /data/local/tmp")
		_RunDOS($adb & " push " & @TempDir & "\geno\su /data/local/tmp")
		_RunDOS($adb & " push " & @TempDir & "\geno\busybox /data/local/tmp")
		_RunDOS($adb & " push " & @TempDir & "\geno\Superuser.apk /data/local/tmp")
		_RunDOS($adb & " push " & @TempDir & "\geno\root.sh /data/local/tmp")
		GUICtrlSetData($TEXT, "ROOT/UNROOT你的手机中...")
		_RunDOS($adb & " shell chmod 0777 /data/local/tmp/mempodroid ")
		_RunDOS($adb & " shell chmod 0777 /data/local/tmp/root.sh ")
		Local $RC1 = _RunDOS($adb & " shell /data/local/tmp/mempodroid " & $offset & " sh /data/local/tmp/root.sh")
		Local $RC2 = _RunDOS($adb & " shell su -c 'echo ok' ")

		If $RC1 <> 0 Or $RC2 <> 0 Then
			MsgBox(4096, "执行失败", "执行失败，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
		Else
			sumessage()
		EndIf
	EndIf
EndFunc   ;==>rootphone

Func unrootphone()
	testlink()
	If $isrooted == "root" And $islink == "link" Then
		Local $adb = @TempDir & "\geno\hwadb"
		If ProcessExists("adb.exe") Then $adb = "adb"
		GUICtrlSetData($TEXT, "UNROOT你的手机中...")
		Local $RC1 = _RunDOS($adb & " shell su -c 'mount -o remount,rw /system; rm /system/app/Superuser.apk;rm /system/bin/su; rm /system/xbin/su' ")
		If $RC1 <> 0 Then
			MsgBox(4096, "执行失败", "执行失败，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
		Else
			sumessage()
		EndIf
	EndIf
EndFunc   ;==>unrootphone

Func changelogo()
	testlink2()
	If $isrooted == "root" And $islink == "link" Then
		Local $adb = @TempDir & "\geno\hwadb"
		If ProcessExists("adb.exe") Then $adb = "adb"
		Local $message = "选择一个JPG图片文件."
		Local $var = FileOpenDialog($message, @WindowsDir & "\", "图像文件 (*.jpg)", 1 + 2)
		If @error Then
			MsgBox(4096, "程序终止", "没有选择文件!")
		Else
			$var = StringReplace($var, "|", @CRLF)
			MsgBox(4096, "提示", "你选择了:" & $var)

			GUICtrlSetData($TEXT, "更换第一屏中，大约需要半分钟左右，请耐心等待...")
			Local $RC1 = _RunDOS(@TempDir & "\geno\bootimg.exe --repack-565 " & $var & " " & @TempDir & "\geno\oemlogo.mbn")
			_RunDOS($adb & " shell su -c 'rm -r /data/cust/logo'")
			_RunDOS($adb & " shell su -c 'mkdir -p /data/cust/logo'")
			_RunDOS($adb & " push " & @TempDir & "\geno\oemlogo.mbn /data/cust/logo")
			_RunDOS($adb & " push " & @TempDir & "\geno\load_oemlogo /data/local/tmp")
			_RunDOS($adb & " shell chmod 0755 /data/local/tmp/load_oemlogo")
			_RunDOS($adb & " shell  su -c 'chown 0.0 /data/local/tmp/load_oemlogo' ")
			Local $RC2 = _RunDOS($adb & " shell  su -c '/data/local/tmp/load_oemlogo' ")
			If $RC1 <> 0 Or $RC2 <> 0 Then
				MsgBox(4096, "更换失败", "更换失败，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
			Else
				MsgBox(4096, "更换完成", "更换完成，如果并未成功更换第一屏，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>changelogo

Func changerecovery()
	testlink2()
	If $isrooted == "root" And $islink == "link" Then
		Local $adb = @TempDir & "\geno\hwadb"
		If ProcessExists("adb.exe") Then $adb = "adb"
		Local $message = "选择recovery镜像文件."
		Local $var = FileOpenDialog($message, @WindowsDir & "\", "recovery镜像 (*.img)", 1 + 2)
		If @error Then
			MsgBox(4096, "程序终止", "没有选择文件")
		Else
			$var = StringReplace($var, "|", @CRLF)
			MsgBox(4096, "提示", "你选择了:" & $var)

			GUICtrlSetData($TEXT, "更换recovery中，请等待...")
			_RunDOS($adb & " push " & @TempDir & "\geno\flash_image /data/local/tmp")
			_RunDOS($adb & " shell chmod 0755 /data/local/tmp/flash_image")
			Local $RC1 = _RunDOS($adb & " push " & $var & " /data/local/tmp/recovery.img")
			Local $RC2 = _RunDOS($adb & " shell  su -c '/data/local/tmp/flash_image " & $RECP & " /data/local/tmp/recovery.img' ")
			If $RC1 <> 0 Or $RC2 <> 0 Then
				MsgBox(4096, "刷入失败", "刷入失败，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
			Else
				MsgBox(4096, "刷入完成", "刷入完成，如果并未成功刷入Recovery，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>changerecovery

Func litesystem()
	testlink2()
	If $isrooted == "root" And $islink == "link" Then
		Local $adb = @TempDir & "\geno\hwadb"
		If ProcessExists("adb.exe") Then $adb = "adb"
		Local $message = "选择精简文件列表."
		Local $var = FileOpenDialog($message, @WindowsDir & "\", "精简列表 (*.txt)", 1 + 2)
		If @error Then
			MsgBox(4096, "程序终止", "没有选择文件")
		Else
			$var = StringReplace($var, "|", @CRLF)
			MsgBox(4096, "提示", "你选择了:" & $var)

			GUICtrlSetData($TEXT, "精简你的系统中，请稍候...")
			Local $RC1 = _RunDOS($adb & " push " & $var & " /data/local/tmp/litelist.txt")
			Local $RC2 = _RunDOS($adb & " shell su -c 'mount -o remount,rw /system;mount -o remount,rw /cust; list=`cat /data/local/tmp/litelist.txt`; for files in $list; do rm -r $files ;done; rm -r /data/local/tmp/* ' ")

			If $RC1 <> 0 Or $RC2 <> 0 Then
				MsgBox(4096, "精简失败", "精简失败，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
			Else
				MsgBox(4096, "精简完成", "精简完成，如果并未成功精简系统，请正确安装手机驱动并确认手机开启了ADB调试，然后将手机连接电脑后重试…", 0)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>litesystem

Func DELINSTALL()
	FileDelete(@TempDir & "\geno\AdbWinApi.dll")
	FileDelete(@TempDir & "\geno\AdbWinUsbApi.dll")
	FileDelete(@TempDir & "\geno\hwadb.exe")
	FileDelete(@TempDir & "\geno\su")
	FileDelete(@TempDir & "\geno\Superuser.apk")
	FileDelete(@TempDir & "\geno\mempodroid")
	FileDelete(@TempDir & "\geno\geno.jpg")
	FileDelete(@TempDir & "\geno\root.sh")
	FileDelete(@TempDir & "\geno\flash_image")
	FileDelete(@TempDir & "\geno\busybox")
	FileDelete(@TempDir & "\geno\7z.exe")
	FileDelete(@TempDir & "\geno\bootloader.img")
	FileDelete(@TempDir & "\geno\oemsbl.img")
	FileDelete(@TempDir & "\geno\bootimg.exe")
	FileDelete(@TempDir & "\geno\load_oemlogo")
	FileDelete(@TempDir & "\geno\sh")
	FileDelete(@TempDir & "\geno\subin")
EndFunc   ;==>DELINSTALL

Func INSTALLZIP()
	testlink2()
	If $isrooted == "root" And $islink == "link" Then
		Local $adb = @TempDir & "\geno\hwadb"
		If ProcessExists("adb.exe") Then $adb = "adb"
		;选择补丁文件
		Local $message = "选择补丁文件."
		Local $var = FileOpenDialog($message, @WindowsDir & "\", "补丁包 (*.zip)", 1 + 2)
		If @error Then
			MsgBox(4096, "程序终止", "没有选择文件")
		Else
			$var = StringReplace($var, "|", @CRLF)
			MsgBox(4096, "提示", "你选择了:" & $var)
			_RunDOS("rmdir /S/Q " & @TempDir & "\geno\tmp_geno")
			GUICtrlSetData($TEXT, "解压补丁包中，请等待...")
			;MsgBox(4096, "提示", @TempDir & "\geno\7z.exe x " & $var & " -o" & @TempDir & "\geno\tmp_geno")
			_RunDOS(@TempDir & "\geno\7z.exe x " & $var & " -aoa -o" & @TempDir & "\geno\tmp_geno")

			;开始安装过程............................................................
			; 安装APK文件
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\system\app\*.apk")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/app")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS(@TempDir & "\geno\7z.exe e " & @TempDir & "\geno\tmp_geno\system\app\" & $file & " -aoa -o" & @TempDir & "\geno\tmp_geno\libs *.so -r")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\system\app\" & $file & " /data/local/tmp/app/")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/app ; cat ' & $file & ' > /system/app/' & $file & ' ; chmod 0644 /system/app/' & $file & ' ; rm /data/local/tmp/app/* " ')
				WEnd
				FileClose($search)
			EndIf
			;安装库文件
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\system\lib\*.so")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/lib")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\system\lib\" & $file & " /data/local/tmp/lib/")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/lib ; cat ' & $file & ' > /system/lib/' & $file & ' ; chmod 0644 /system/lib/' & $file & ' ; rm /data/local/tmp/lib/* " ')
				WEnd
				FileClose($search)
			EndIf
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\libs\*.so")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/lib")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\libs\" & $file & " /data/local/tmp/lib/")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/lib ; cat ' & $file & ' > /system/lib/' & $file & ' ; chmod 0644 /system/lib/' & $file & ' ; rm /data/local/tmp/lib/* " ')
				WEnd
				FileClose($search)
			EndIf
			;安装框架文件
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\system\framework\*")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/framework")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\system\framework\" & $file & " /data/local/tmp/framework/")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/framework ; cat ' & $file & ' > /system/framework/' & $file & ' ; chmod 0644 /system/framework/' & $file & ' ; rm /data/local/tmp/framework/* " ')
				WEnd
				FileClose($search)
			EndIf
			;安装权限文件
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\system\etc\permissions\*.xml")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/etc/permissions")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\system\etc\permissions\" & $file & " /data/local/tmp/etc/permissions")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/etc/permissions ; cat ' & $file & ' > /system/etc/permissions/' & $file & ' ; chmod 0644 /system/etc/permissions/' & $file & ' ; rm /data/local/tmp/etc/permissions/* " ')
				WEnd
				FileClose($search)
			EndIf
			;安装Bin文件
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\system\bin\*")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/bin")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\system\bin\" & $file & " /data/local/tmp/bin")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/bin ; cat ' & $file & ' > /system/bin/' & $file & ' ; chmod 0755 /system/bin/' & $file & ' ; rm /data/local/tmp/bin/* " ')
				WEnd
				FileClose($search)
			EndIf
			;安装字体文件
			$search = FileFindFirstFile(@TempDir & "\geno\tmp_geno\system\fonts\*")
			If $search = -1 Then
				FileClose($search)
			Else
				_RunDOS($adb & " shell mkdir -p /data/local/tmp/fonts")
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlSetData($TEXT, "安装" & $file & "...")
					_RunDOS($adb & " push " & @TempDir & "\geno\tmp_geno\system\fonts\" & $file & " /data/local/tmp/fonts")
					_RunDOS($adb & ' shell su -c " mount -o remount rw /system ; cd /data/local/tmp/fonts ; cat ' & $file & ' > /system/fonts/' & $file & ' ; chmod 0644 /system/fonts/' & $file & ' ; rm /data/local/tmp/fonts/* " ')
				WEnd
				FileClose($search)
			EndIf
			_RunDOS($adb & " shell rm -r /data/local/tmp/*")
			_RunDOS("rmdir /S/Q " & @TempDir & "\geno\tmp_geno")
			MsgBox(0, "安装完成", "补丁已经安装完成，你可能需要重启手机以使某些补丁生效。如果安装过程中手机曾经自动重启，这是由于替换关键文件导致的，那么你需要再安装补丁一次", 15)
		EndIf
	EndIf
EndFunc   ;==>INSTALLZIP

Func help() ;退出
	;$helptip = ToolTip("暂时没有帮助信息")
	ToolTip("正在解压系统镜像，所需时间较长，请耐心稍后片刻…………", "", "", "安装通知", "", "1")
EndFunc   ;==>help

Func _Exit() ;退出

	Exit
EndFunc   ;==>_Exit

