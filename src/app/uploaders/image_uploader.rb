class ImageUploader < CarrierWave::Uploader::Base
  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

  # 画像の上限を640x480にする
  process resize_to_limit: [640, 480]

  # 保存形式をJPGにする
  process convert: 'jpg'

  # サムネイルを生成する設定

  version :thumb1000 do
    process resize_to_limit: [1000, 1000]
  end

  version :thumb800 do
    process resize_to_limit: [800, 800]
  end

  version :thumb300 do
    process resize_to_limit: [300, 300]
  end

  version :thumb200 do
    process resize_to_limit: [200, 200]
  end

  version :thumb100 do
    process resize_to_limit: [100, 100]
  end

  version :thumb50 do
    process resize_to_limit: [50, 50]
  end

  version :thumb30 do
    process resize_to_limit: [30, 30]
  end

  version :thumb20 do
    process resize_to_limit: [20, 20]
  end

  def default_url(*_args)
    [version_name, 'default.png'].compact.join('_')
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w[jpg jpeg gif png]
  end

  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # ファイル名を日付にするとタイミングのせいでサムネイル名がずれる
  # ファイル名はランダムで一意になる
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
