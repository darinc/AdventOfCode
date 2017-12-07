SELECT "Advent of Code Day 4 - SQL";
drop procedure if exists stocking_stuffer;

delimiter #
create procedure stocking_stuffer(IN input VARCHAR(255))
begin

declare solved_part1 boolean default 0;
declare solved_part2 boolean default 0;
declare counter int unsigned default 0;
declare coin char(32);

  search_coins: LOOP
    SET coin = MD5(CONCAT(input, counter));

    IF solved_part1 = 0 AND STRCMP(SUBSTR(coin FROM 1 FOR 5), "00000") = 0 THEN
      SELECT CONCAT("Santa found the part1 coin at ", counter);
      SET solved_part1 = 1;
    END IF;

    IF solved_part2 = 0 AND STRCMP(SUBSTR(coin FROM 1 FOR 6), "000000") = 0 THEN
      SELECT CONCAT("Santa found the part2 coin at ", counter);
      SET solved_part2 = 1;
    END IF;

    IF solved_part1 = 1 AND solved_part2 = 1 THEN
     LEAVE search_coins;
    END IF;

    SET counter=counter+1;
  end LOOP search_coins;
end #
delimiter;

call stocking_stuffer("yzbqklnj");
