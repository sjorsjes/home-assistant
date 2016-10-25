from homeassistant.helpers.entity import Entity
from homeassistant.const import (CONF_NAME)
import logging
import time
from datetime import timedelta
from homeassistant.util import Throttle

REQUIREMENTS = [
    'https://github.com/koen01/pybuienradar/archive/v0.5.zip#pybuienradar==0.5']

MIN_TIME_BETWEEN_UPDATES = timedelta(minutes=5)
ATTR_TOTAL = 'Total'
ATTR_AVERAGE = 'Average'
ATTR_TIMEFRAME = 'Timeframe'
ATTR_UPDATED = 'Update'
CONF_TIMEFRAME = 'timeframe'

_LOGGER = logging.getLogger(__name__)

def setup_platform(hass, config, add_devices, discovery_info=None):
    """Setup the buienradar platform."""
    name = config.get(CONF_NAME)
    latitude = hass.config.latitude
    longitude = hass.config.longitude
    timeframe = config.get(CONF_TIMEFRAME)
    add_devices([BuienradarSensor(name, latitude, longitude, timeframe)])

class BuienradarSensor(Entity):
    """Representation of a Sensor."""
    def __init__(self, name, latitude, longitude, timeframe):
        """Initialize the sensor."""
        import pybuienradar
        self._buienradar = pybuienradar.forecast(
            latitude, longitude)
        self._timeframe = timeframe
        self._state = None
        self._name = name
        self._unit_of_measurement = 'mm/h'
        self.update()

    @property
    def name(self):
        """Return the name of the sensor."""
        return self._name

    @property
    def state(self):
        """Return the state of the sensor."""
        return self._state

    @property
    def unit_of_measurement(self):
        """Return the unit of measurement."""
        return self._unit_of_measurement

    @property
    def device_state_attributes(self):
        """Return the state attributes."""
        if self.data is not None:
            return {
                ATTR_TOTAL: self.data['totalrain'] ,
                ATTR_AVERAGE: self.data['averagerain'],
                ATTR_TIMEFRAME: self.data['timeframe'],
                ATTR_UPDATED: self.data['time']
            }

    @Throttle(MIN_TIME_BETWEEN_UPDATES)
    def update(self):
        """Get the latest data and updates the state."""
        now = time.strftime("%H:%M")
        self.data = self._buienradar.get_forecast(now, self._timeframe)
        self._state = self.data["averagerain"]
