import Icon from "https://deno.land/x/tabler_icons_tsx@0.0.1/tsx/brand-youtube.tsx";

type Props = {
  active: string;
};

export default function Header({ active }: Props) {
  const menus = [
    { name: "Home", href: "/" },
    { name: "Short", href: "/short" },
    { name: "Watch", href: "/watch" },
  ];

  return (
    <div className="flex flex-col md:flex-row bg-white w-full py-6 px-8 gap-4 m-auto">
      <a href="/" title="QTube" className="flex items-center flex-1">
        <Icon />
        <div className="text-2xl ml-1 font-bold">QTube</div>
      </a>
      <ul className="flex items-center gap-6">
        {menus.map((menu) => (
          <li>
            <a
              href={menu.href}
              class={"text-gray-500 hover:text-gray-700 py-1 border-gray-500" +
                (menu.name === active ? " font-bold border-b-2" : "")}
            >
              {menu.name}
            </a>
          </li>
        ))}
      </ul>
    </div>
  );
}
