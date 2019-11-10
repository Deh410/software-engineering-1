require "shrine"
require "shrine/storage/file_system"
require "image_processing/mini_magick"
require "image_processing/mini_magick"

MiniMagick.cli = :graphicsmagick

processed = ImageProcessing::MiniMagick
  .source(image)
  .resize_to_limit(400, 400)
  .strip
  .call # will use `gm convert` instead of `convert`


processed = ImageProcessing::MiniMagick
  .source(image)
  .resize_to_limit(400, 400)
  .strip
  .call
 
Shrine.storages = { 
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent 
}
 
Shrine.plugin :activerecord # or :activerecord 
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays 
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file 