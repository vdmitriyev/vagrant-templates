#!/usr/bin/env tarantool

box.cfg{}
-- Создаёт таблички при первом запуске
box.once('schema', function()
	box.schema.create_space('hosts')
	box.space.hosts:create_index('primary', { type = 'hash',
    	parts = {1, 'str'} })
end)

-- Обработчик GET-запросов к /
local function handler(self)
	-- Получаем IP-адрес клиента
	local ipaddr = self.peer.host
	-- Вставляем новую запись для адреса или инкрементируем существующую
	box.space.hosts:upsert({ ipaddr, 1 }, {{'+', 2, 1}})
	-- Возвращаем все записи в виде JSON клиенту
	return self:render{ json = box.space.hosts:select() }
end

local httpd = require('http.server')
local server = httpd.new('127.0.0.1', 8080)
server:route({ path = '/'  }, handler)
server:start()