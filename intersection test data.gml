
#define setObject
///setDummyObject(object)
//set dummy object for storing data
global.ITObject = argument0;

#define deleteData
///deleteObject(data)
switch(argument0.x) {
    case 1:
        with(argument0.hit) {
            instance_destroy();
        }
        break;
    default:
        break;
}
with(argument0) {
    instance_destroy();
}

#define newHit
///newHit(id)
//0 = collider, 1 = position, 2 = normal, 3 = overlap
var ID;
ID = instance_create(0, 0, global.ITObject);
instance_deactivate_object(ID);
ID.collider = argument0;
ID.position = newVec(0, 0);
ID.normal = newVec(0, 0)
ID.overlap = newVec(0, 0)
return ID;

#define newSweep
///newSweep()
var ID;
ID = instance_create(1, 0, global.ITObject);
instance_deactivate_object(ID);
ID.hit = noone;
ID.position = newVec(0, 0);
ID.time = 1;
return ID;

#define newSegment
///newSegment(vec, vec)
//0 = position, 1 = direction
var ID;
ID = instance_create(2, 0, global.ITObject);
instance_deactivate_object(ID);
ID.position = argument0;
ID.Direction = argument1;
return ID;

#define newAABB
///newAABB(vec, vec)
//0 = position, 1 = half size
var ID;
ID = instance_create(3, 0, global.ITObject);
instance_deactivate_object(ID);
ID.position = argument0;
ID.size = argument1;
return ID;