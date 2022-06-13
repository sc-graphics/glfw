project "glfw"
  kind "StaticLib"
  language "C"
    
  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  files
  {
    "include/GLFW/glfw3.h",
    "include/GLFW/glfw3native.h",
    "src/glfw_config.h",
    "src/context.c",
    "src/init.c",
    "src/input.c",
    "src/monitor.c",
    "src/platform.c",
    "src/vulkan.c",
    "src/window.c",
    "src/egl_context.c",
    "src/osmesa_context.c",
    "src/null_init.c",
    "src/null_monitor.c",
    "src/null_window.c",
    "src/null_joystick.c"
    }
    
  filter "system:windows"
  systemversion "10.0.17134.0"
  staticruntime "On"
  
  files
  {
    "src/win32_init.c",
    "src/win32_joystick.c",
    "src/win32_monitor.c",
    "src/win32_time.c",
    "src/win32_thread.c",
    "src/win32_window.c",
    "src/wgl_context.c",
  }

  defines 
  { 
    "_GLFW_WIN32",
    "_CRT_SECURE_NO_WARNINGS"
  }

  filter "system:macosx"
    files {
      "src/cocoa_time.c",
      "src/posix_module.c",
      "src/posix_thread.c",
      "src/cocoa_init.m",
      "src/cocoa_joystick.m",
      "src/cocoa_monitor.m",
      "src/cocoa_window.m",
      "src/nsgl_context.m"
    }
    defines {
      "_GLFW_COCOA"
    }
    links {
      "Cocoa.framework",
      "IOKit.framework",
      "CoreFoundation.framework"
    }
  filter { "system:windows", "configurations:Release" }
      buildoptions "/MT"
