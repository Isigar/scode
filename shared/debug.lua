function sprint(msg,...)
    return string.format(msg,...)
end

function isAllowed(level)
    if Config.Debug then
        if isTable(Config.DebugLevel) and not emptyTable(Config.DebugLevel) then
            for _,lev in pairs(Config.DebugLevel) do
                if lev == level then
                    return true
                end
            end
            return false
        else
            if level == Config.DebugLevel then
                return true
            end
            return false
        end
    end
end

function rdebug()
    local self = {}
    self.info = function(msg,...)
        if isAllowed('INFO') then
            print('^5[rcore2|info] ^7'..sprint(msg,...))
        end
    end
    self.critical = function(msg,...)
        if isAllowed('CRITICAL') then
            print('^1[rcore2|critial] ^7'..sprint(msg,...))
        end
    end
    self.exception = function(msg,...)
        if isAllowed('EXCEPTION') then
            print('^1[rcore2|critial] ^7'..sprint(msg,...))
        end
    end
    self.security = function(msg,...)
        if isAllowed('SECURITY') then
            print('^3[rcore2|security] ^7'..sprint(msg,...))
        end
    end
    self.debug = function(msg,...)
        if isAllowed('DEBUG') then
            print('^2[rcore2|debug] ^7'..sprint(msg,...))
        end
    end
    return self
end

exports('rdebug',rdebug)

function dprint(str, ...)
    local dbg = rdebug()
    dbg.info(str,...)
end
