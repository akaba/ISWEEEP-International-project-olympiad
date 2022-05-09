DataSource    = "D:\Web\isweeep\App_Data\isweeep.mdb"
ArchiveFolder = "D:\Web\isweeep\Archive\"

Backup

sub Backup
    temp = ArchiveFolder & "temp.mdb"
    target = ArchiveFolder & Year(Now()) &  "." & Right("0" & Month(Now()),2) & "." & Right("0" & Day(Now()),2) & ".mdb"

    Set fs = CreateObject("Scripting.FileSystemObject")
    if fs.fileExists(temp) then
    	fs.deleteFile temp
    end if

    if fs.fileExists(target) then
    	fs.deleteFile target
    end if

    fs.CopyFile DataSource, temp, true

    wscript.sleep(10000)

    Set app = CreateObject("Access.Application")
    app.CompactRepair temp, target

    wscript.sleep(10000)

    if fs.fileExists(temp) then
        fs.deleteFile temp
    end if

    Set fs = Nothing
    Set app = Nothing
end sub