follow_obj = (room == rm_intro) ? obj_spark : global.PlayerManager.Get();

global.camera = camera_controller(follow_obj, true, 0);