# frozen_string_literal: true

module VitalDecorator
  def check_temprature
    if temperature >= 38
      return 'red'
    elsif temperature <= 35
      return 'blue'
    end
  end

  def check_high_bp
    if high_bp >= 140
      return 'red'
    elsif high_bp <= 100
      return 'blue'
    end
  end

  def check_low_bp
    if low_bp >= 90
      return 'red'
    elsif low_bp <= 60
      return 'blue'
    end
  end

  def check_pulse
    if pulse >= 100
      return 'red'
    elsif pulse <= 60
      return 'blue'
    end
  end

  def check_oxygen_saturation
    if oxygen_saturation > 99
      return 'red'
    elsif oxygen_saturation  < 96
      return 'blue'
    end
  end
end
