CREATE OR REPLACE FUNCTION get_addresses()
            RETURNS TABLE(name VARCHAR, id INT) AS
            $$ BEGIN
            RETURN QUERY
            select address, address_id from address where city_id > 400 and city_id < 600 and address.address like '%11%';
            END
            $$ LANGUAGE plpgsql;