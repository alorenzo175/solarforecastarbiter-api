--
CREATE TABLE arbiter_data.reports (
    id BINARY(16) NOT NULL DEFAULT (UUID_TO_BIN(UUID(), 1)),
    organization_id BINARY(16) NOT NULL,
    definition JSON NOT NULL,
    status ENUM('pending', 'finished', 'failed') NOT NULL DEFAULT 'pending',
    result BLOB NOT NULL, -- then need update on reports?
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id)
        REFERENCES organizations(id)
        ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=INNODB ENCRYPTION='Y' ROW_FORMAT=COMPRESSED;


CREATE TABLE arbiter_data.report_data (
    id BINARY(16) NOT NULL DEFAULT (UUID_TO_BIN(UUID(), 1)),
    report_id BINARY(16) NOT NULL,
    object_id BINARY(16) NOT NULL,
    data_object BLOB,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    KEY (object_id),
    FOREIGN KEY (report_id)
        REFERENCES arbiter_data.reports(id)
        ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=INNODB ENCRYPTION='Y' ROW_FORMAT=COMPRESSED;

-- triggers on delete forecast or obs
-- permissions including permissiosn to read report and permission to access report data
-- reports should have cli to make with signature that indicates it is preliminary
-- maybe on read, should verify that signed correctly
