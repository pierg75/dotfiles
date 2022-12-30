-- Setup impatient.
local status_ok, imp = pcall(require, "impatient")
if not status_ok then
  return
end

imp.enable_profile()

