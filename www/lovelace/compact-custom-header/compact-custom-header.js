class CompactCustomHeader extends HTMLElement {
	set hass(hass) {
	  window.cch_header = this.config.header == undefined ? true : this.config.header;
	  window.cch_menu = this.config.menu == undefined ? true : this.config.menu;
	  window.cch_notify = this.config.notification == undefined ? true : this.config.notification;
	  window.cch_voice = this.config.voice == undefined ? true : this.config.voice;
	  window.cch_options = this.config.options == undefined ? true : this.config.options;
	  window.cch_clock = this.config.clock == undefined ? true : this.config.clock;
	  window.cch_clock_format = this.config.clock_format == undefined ? 12 : this.config.clock_format;
	  window.cch_am_pm = this.config.clock_am_pm == undefined ? true : this.config.clock_am_pm;
	  const script = document.createElement('script');
	  script.src = '/local/lovelace/compact-custom-header/cch_v001.js';
	  document.head.appendChild(script);
	}
	setConfig(config) {
	  this.config = config;
	}
	getCardSize() {
	  return 0;
	}
  }
  customElements.define('compact-custom-header', CompactCustomHeader);
