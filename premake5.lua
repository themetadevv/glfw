outputdir = "%{cfg.system}/%{cfg.buildcfg}"
build_dir = "bin/builds/" ..outputdir.. "/%{prj.name}"
intermediates_dir = "bin/intermediates/" ..outputdir.. "/%{prj.name}"
distributions_dir= "bin/distribution/"

project "GLFW"
	location "."
	kind "StaticLib"
	language "C"

	targetdir (outputdir)
	objdir (intermediates_dir)

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/platform.h",
		"src/mappings.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c",
		"src/null_platform.h",
		"src/null_joystick.h",
		"src/null_init.c",

		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On" --staticly linking the runtime libraries

		files
		{
			"src/win32_init.c",
			"src/win32_module.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.h",
			"src/win32_time.c",
			"src/win32_thread.h",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
