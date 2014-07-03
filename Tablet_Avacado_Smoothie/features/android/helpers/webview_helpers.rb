module WebViewHelpers

  def visible?(uiquery)
    frame_height = (query "FrameLayout")[0]["rect"]["height"]
    frame_width = (query "FrameLayout")[0]["rect"]["width"]
    test_height = (query uiquery)[0]["rect"]["center_y"]
    test_width = (query uiquery)[0]["rect"]["center_x"]

    if within_frame_y?(test_height, frame_height) && within_frame_x?(test_width, frame_width)
      true
    else
      false
    end

  end

  def within_frame_y?(test_height, frame_height)
    test_height < frame_height && test_height > 0
  end

  def within_frame_x?(test_width, frame_width)
    test_width < frame_width && test_width > 0
  end


end

