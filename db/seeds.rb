if Menu.count == 0
	# основные разделы
	Menu.create(name: 'Живые цветы', link: 'live')
	menu_1 = Menu.create(name: 'Букеты', link: 'bouquet')
	Menu.create(name: 'Цветочные композиции', link: 'compositions')
	menu_2 = Menu.create(name: 'Свадебная флористика', link: 'wedding')
	Menu.create(name: 'Букеты из конфет', link: 'candies')
	Menu.create(name: 'Букеты из игрушек', link: 'toys')
	Menu.create(name: 'Горшечные растения', link: 'pots')
	Menu.create(name: 'Товары для праздника', link: 'holidays')
	# второстепенные разделы
	Menu.create(name: 'Женские', upper_id: menu_1.id, link: 'female')
	Menu.create(name: 'Мужские', upper_id: menu_1.id, link: 'male')
	Menu.create(name: 'Детские', upper_id: menu_1.id, link: 'children')
	Menu.create(name: 'Корпоративные', upper_id: menu_1.id, link: 'corporation')
	Menu.create(name: 'Букет невесты', upper_id: menu_2.id, link: 'bride')
	Menu.create(name: 'Бутоньерки', upper_id: menu_2.id, link: 'buttonhole')
	Menu.create(name: 'Оформление торжества', upper_id: menu_2.id, link: 'registraion')
	Menu.create(name: 'Аксессуары', upper_id: menu_2.id, link: 'accessories')
end

# заполнение тестовыми товарами
if Product.count == 0
	Menu.all.each do |menu|
		(1..12).each do |x|
			Product.create(name: "Супербукет_#{x}", price: x, caption: "Супербукет_#{x}", menu_id: menu.id, availability: true, link: "#{menu.id}_#{x}")
		end
	end
end

if Manager.count == 0
	Manager.create(email: 'tester@tester.com', password: 'Tester85')
end