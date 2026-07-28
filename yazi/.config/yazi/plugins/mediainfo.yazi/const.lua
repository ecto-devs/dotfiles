--- @since 26.1.22

local M = {}

M.skip_labels = {
	-- Identifiers / paths
	["Complete name"] = true,
	["CompleteName_Last"] = true,
	["Unique ID"] = true,
	["MD5 of the unencoded content"] = true,

	-- Verbose format descriptions
	["Format/Info"] = true,
	["Codec ID/Info"] = true,
	["Format version"] = true,
	["Format settings"] = true,
	["Codec ID"] = true,
	["Codec configuration box"] = true,
	["Internet media type"] = true,
	["Commercial name"] = true,
	["Codec"] = true,

	-- Dates / software
	["Encoded date"] = true,
	["Tagged date"] = true,
	["Writing application"] = true,
	["Writing library"] = true,
	["Encoding settings"] = true,
	["Encoder"] = true,
	["Tagged_Application"] = true,

	-- Stream metadata
	["Stream size"] = true,
	["Stream order"] = true,
	["Source stream size"] = true,
	["Title"] = true,
	["Language"] = true,
	["Source"] = true,
	["Source duration"] = true,
	["Source frame count"] = true,
	["Original source medium"] = true,
	["Extra"] = true,

	-- Color technical details
	["Color primaries"] = true,
	["Transfer characteristics"] = true,
	["Matrix coefficients"] = true,
	["Color range"] = true,
	["Pixel aspect ratio"] = true,
	["Display aspect ratio"] = true,
	["Standard"] = true,

	-- Scan / interlace
	["Scan type"] = true,
	["Scan order"] = true,
	["Interlacement"] = true,

	-- Bitrate details
	["Bit rate mode"] = true,
	["Maximum bit rate"] = true,
	["Nominal bit rate"] = true,

	-- Audio technical details
	["Channel layout"] = true,
	["Sampling count"] = true,
	["Service kind"] = true,
	["Service name"] = true,

	-- Frame rate details
	["Frame rate mode"] = true,

	-- Timing / delay
	["Delay"] = true,
	["Delay relative to video"] = true,
	["Video delay"] = true,
	["Time code of first frame"] = true,
	["Time code"] = true,

	-- Misc technical
	["Bits/(Pixel*Frame)"] = true,
	["Proportion of this stream"] = true,
	["Reel"] = true,
	["Count"] = true,
	["Count of video streams"] = true,
	["Count of audio streams"] = true,
	["Count of image streams"] = true,
	["Count of other streams"] = true,
	["Duration_Last"] = true,
	["Duration_Start"] = true,
}

M.ENTRY_ACTION = {
	toggle_metadata = "toggle-metadata",
	toggle_preview = "toggle-preview",
	hide_metadata = "hide-metadata",
	hide_preview = "hide-preview",
	show_metadata = "show-metadata",
	show_preview = "show-preview",
	reset = "reset",
}

M.STATE_KEY = {
	units = "units",
	no_metadata = "no_metadata",
	no_preview = "no_preview",
	prev_metadata_area = "prev_metadata_area",
	prev_image_height = "prev_image_height",
	last_valid_mediainfo_skip = "last_valid_mediainfo_skip",
	cached_mediainfo = "cached_mediainfo",
	cached_job_args = "cached_job_args",
}

M.magick_image_mimes = {
	avif = true,
	hei = true,
	heic = true,
	heif = true,
	["heif-sequence"] = true,
	["heic-sequence"] = true,
	jxl = true,
	tiff = true,
	xml = true,
	-- ["svg+xml"] = true,
	["canon-cr2"] = true,
}

M.seekable_mimes = {
	-- NOTE: Adobe illustrator photoshop mimetypes
	["application/postscript"] = true,
	["application/dvb.ait"] = true,
	["application/illustrator"] = true,
	["application/vnd.adobe.illustrator"] = true,
	["image/x-eps"] = true,
	["application/eps"] = true,
	["application/pdf"] = true,

	["image/adobe.photoshop"] = true,
}

M.suffix = "_mediainfo"
M.SHELL = os.getenv("SHELL") or ""

return M
