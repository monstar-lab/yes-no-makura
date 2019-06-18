require 'rqrcode'

module ApplicationHelper

  # Thanh Do 2019/06/07
  # Generate QR code with svg format based on input string and size
  # Params:
  # - string: (required) string to be encoded
  # - size: (required) size of svg to be shown
  def qr_gen(string, size)
    qr = RQRCode::QRCode.new(string)
    qr.as_svg(offset: 0, color: '000',
              shape_rendering: 'crispEdges',
              module_size: size)
  end
end
