#!/usr/bin/env bats

@test "/var/www/ is created!" {
  run ls -l /var/www/
  [ "$status" -eq 0 ]
}

@test "/var/www/test/current is created!" {
  run ls -l /var/www/test/current
  [ "$status" -eq 0 ]
}