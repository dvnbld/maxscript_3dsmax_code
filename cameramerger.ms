try (
	function CompareNames str1 str2 = (
		stricmp str1.name str2.name
		)

	fn CheckIfExist str str2= (
		local check = 0
		for cam in cameras do (
			if cam.name == str then
				format "Have a camera allready. \n Please, delete it. Select cameras to merge it all into one."
			else
				check = 1
		)
		if check==1 do 
			--Targetcamera name: str pos:[0,0,0] target:(Targetobject name: str2 transform:(matrix3 [1,0,0] [0,1,0] [0,0,1] [0,0,0]))
		Targetcamera name: str target:(Targetobject name: str2)
	)

	global NewCameraName = "CameraMerged"
	global NewCameraNameTarget = "CameraMerged.Target"
	global CameraAr = #()

	--collect all selected Camera into array
	for cam in selection do if not cam.isTarget do append CameraAr cam
	qSort CameraAr CompareNames

	if selection.count > 1 then t = CheckIfExist NewCameraName NewCameraNameTarget
		else format "Select camera to merge\n"

	for key=1 to CameraAr.count do(
		local tar = CameraAr[key].target
		local cam = CameraAr[key]
		with animate on at time key(
			t.transform = cam.transform
			t.target.transform = tar.transform
		)
	)
	
	max modify mode
	for b in getNodeByName NewCameraName do(
		modPanel.setCurrentObject b.baseObject
		macros.run "Lights and Cameras" "CameraCorrection_Quad"
	)
	sliderTime = 1
	viewport.setCamera "$"+NewCameraName
	max vpt camera
)	
catch()