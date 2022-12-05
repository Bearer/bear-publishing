require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: 'my-segment-key',
    on_error: Proc.new { |status, msg| print msg }
})
