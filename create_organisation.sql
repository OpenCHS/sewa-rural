CREATE ROLE sewa_rural
  NOINHERIT
  NOLOGIN;

GRANT sewa_rural TO openchs;

GRANT ALL ON ALL TABLES IN SCHEMA public TO sewa_rural;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO sewa_rural;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO sewa_rural;

INSERT INTO organisation (name, db_user, uuid, parent_organisation_id)
VALUES ('Sewa Rural', 'sewa_rural', 'b5399a48-60c4-4cea-b19e-d824c9dd00f5', 1);