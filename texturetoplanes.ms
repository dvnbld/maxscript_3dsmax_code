files_ar = getFiles "C:\\...\\...\\*.png"

for file in files_ar do print file

for i=1 to files_ar.count do
(
    meditMaterials[i] = VRayMtl texmap_diffuse:(Bitmaptexture fileName:files_ar[i])
    bmap = openBitmap files_ar[i]
    img_h = bmap.height
    img_w = bmap.width
    pln = Plane length:img_h width:img_w pos:[0,0,0]
    pln.material = meditMaterials[i]
    )