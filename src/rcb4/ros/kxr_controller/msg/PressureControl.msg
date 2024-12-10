uint16 board_idx  # Do not use board id? (Currently, bus-connected air board is not supported)
float32 start_pressure  # Threshold [kPa] to start pump (Currently, pressurization is not supported)
float32 stop_pressure  # Threshold [kPa] to stop pump (Currently, pressurization is not supported)
bool release  # Set true to release air by opening valve.
