if Menu.count == 0
	# основные разделы
	Menu.create(name: 'Живые цветы', link: 'live', image: 'menu-live.png')
	menu_1 = Menu.create(name: 'Букеты', link: 'bouquet', image: 'menu-bouquet.png')
	Menu.create(name: 'Цветочные композиции', link: 'compositions', image: 'menu-compositions.png')
	menu_2 = Menu.create(name: 'Свадебная флористика', link: 'wedding', image: 'menu-wedding.png')
	Menu.create(name: 'Сладкие букеты', link: 'candies', image: 'menu-candies.png')
	Menu.create(name: 'Букеты из игрушек', link: 'toys', image: 'menu-toys.png')
	Menu.create(name: 'Горшечные растения', link: 'pots', image: 'menu-pots.png')
	Menu.create(name: 'Товары для праздника', link: 'holidays', image: 'menu-holidays.png')
	Menu.create(name: 'Товары для сада', link: 'garden', image: 'menu-garden.png')
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
