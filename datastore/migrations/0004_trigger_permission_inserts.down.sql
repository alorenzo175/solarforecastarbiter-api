DROP TRIGGER add_object_perm_on_permissions_insert;
DROP TRIGGER no_permissions_update;
DROP TRIGGER add_object_perm_on_sites_insert;
DROP TRIGGER add_object_perm_on_aggregates_insert;
DROP TRIGGER add_object_perm_on_forecasts_insert;
DROP TRIGGER add_object_perm_on_observations_insert;
DROP TRIGGER add_object_perm_on_users_insert;
DROP TRIGGER add_object_perm_on_roles_insert;
DROP TRIGGER remove_object_perm_on_observations_delete;
DROP TRIGGER remove_object_perm_on_forecasts_delete;
DROP TRIGGER remove_object_perm_on_aggregates_delete;
DROP TRIGGER remove_object_perm_on_users_delete;
DROP TRIGGER remove_object_perm_on_roles_delete;
DROP TRIGGER remove_object_perm_on_sites_delete;
DROP USER 'permission_trig'@'localhost';
